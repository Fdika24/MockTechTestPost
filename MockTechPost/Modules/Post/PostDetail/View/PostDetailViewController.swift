//
//  PostDetailViewController.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import UIKit
import RxSwift
import SkeletonView

final class PostDetailViewController: UIViewController {
    
    var presenter:PostDetailPresenterProtocol?
    
    private let dispatchGroup = DispatchGroup()
    private var commentDatas:[CommentEntity] = [ ]
    private let disposeBag = DisposeBag()
    
    private lazy var tableView = UITableView(
        frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height),
        style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        configureTableView()
        
        presenter?
            .getCommentList()
            .subscribe(onNext: {[weak self] comments in
                DispatchQueue.main.async {
                    self?.commentDatas = comments
                    self?.tableView.reloadData()
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostDetailHeader.self, forHeaderFooterViewReuseIdentifier: PostDetailHeader.identifier)
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func NavigateToUser() {
        let userDetailVC = presenter?.gotoUserDetail()
        navigationController?.pushViewController(userDetailVC!, animated: true)
    }
}






extension PostDetailViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as! CommentTableViewCell
        let cellData = commentDatas[indexPath.row]
        
        cell.configureItems(name: cellData.name, body: cellData.body)
        cell.nameTapped = {
           // self.NavigateToUser()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentDatas.count
    }
    func tableView(_ tableView: UITableView,
                            viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: PostDetailHeader.identifier) as! PostDetailHeader
        view.configureHeader(title: presenter!.getTitle(), name: presenter!.getUserName(), body: presenter!.getBody())
        view.nameLabelTappedCallback = {
            self.NavigateToUser()
        }
        return view
    }
    
    
}
