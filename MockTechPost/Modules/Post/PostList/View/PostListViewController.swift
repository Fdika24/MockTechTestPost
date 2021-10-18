//
//  PostListViewController.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import UIKit
import RxSwift
import SkeletonView

final class PostListViewController: UIViewController {
    private var postDatas:[PostEntity] = []
    private var usersData = [UserEntity]()
    
    private lazy var postListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PostListTableViewCell.self, forCellReuseIdentifier: PostListTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var presenter:PostListPresenterProtocol?
    
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        postListTableView.delegate = self
        postListTableView.dataSource = self
        postListTableView.rowHeight = 230
        configureData()
        view.addSubview(postListTableView)
        configurelayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if usersData.isEmpty {
            postListTableView.isSkeletonable = true
            postListTableView.showSkeleton(usingColor: .wetAsphalt, transition: .crossDissolve(0.25))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Post list"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func configurelayout(){
        NSLayoutConstraint.activate([
            postListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func configureData() {
        let groupDispatch = DispatchGroup()
        //MARK: Bind Data
        groupDispatch.enter()
        presenter? //.observe(on: MainScheduler.instance)
            .presentPostList()
            .subscribe(
                onNext: { [weak self] posts in
                        if let self = self  {
                            DispatchQueue.global().async {
                                self.postDatas = posts
                                groupDispatch.leave()
                            }
                        }
                    }
            )
            .disposed(by: disposeBag)
        
        groupDispatch.enter()
        presenter?
            .presentUsers()
            .subscribe(onNext: { users in
                DispatchQueue.global().async {
                    self.usersData = users
                    groupDispatch.leave()
                }
            })
            .disposed(by: disposeBag)
        
        groupDispatch.notify(queue: DispatchQueue.main){
            self.postListTableView.reloadData()
            self.postListTableView.stopSkeletonAnimation()
            self.view.hideSkeleton()
        }
    }
}


extension PostListViewController:UITableViewDelegate, SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostListTableViewCell.identifier, for: indexPath) as! PostListTableViewCell
        let dataForCell = postDatas[indexPath.row]
        let userData:UserEntity = usersData[dataForCell.userId-1]
        cell.configureCell(title: dataForCell.title, name: userData.name, companyName: userData.company.name, body: dataForCell.body)
        cell.selectionStyle = .none
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return PostListTableViewCell.identifier
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataForCell = postDatas[indexPath.row]
        let userData = usersData[dataForCell.userId-1]
        let postDetailVC = presenter?.moveToDetailVC(postItem: dataForCell,userData: userData)
        navigationController?.pushViewController(postDetailVC!, animated: true)
    }
    
    
}
