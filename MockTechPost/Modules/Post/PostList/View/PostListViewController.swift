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
    
    private lazy var postListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        configureData()
        view.addSubview(postListTableView)
        configurelayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        postListTableView.isSkeletonable = true
        postListTableView.showSkeleton(usingColor: .wetAsphalt, transition: .crossDissolve(0.25))
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
        //MARK: Bind Data
        presenter?
            .presentPostList()
            .subscribe(
                onNext: { [weak self] posts in
                        if let self = self  {
                            self.postDatas = posts
                            self.postListTableView.reloadData()
                            self.postListTableView.stopSkeletonAnimation()
                            self.view.hideSkeleton()
                        }
                    }
            )
            .disposed(by: disposeBag)
    }
}


extension PostListViewController:UITableViewDelegate, SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = postDatas[indexPath.row].title
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
}
