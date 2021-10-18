//
//  UserDetailViewController.swift
//  MockTechPost
//
//  Created by Farhandika on 17/10/21.
//

import UIKit
import RxSwift

class UserDetailViewController: UIViewController {
    
    var presenter:UserDetailPresenterProtocol?
    private var userAlbumDatas:[AlbumEntity] = []
    private var photosData = [PhotoEntity]()
    
    private let disposable = DisposeBag()
    
    private lazy var scrollView = UIScrollView(frame: view.bounds)
    
    private lazy var userInfoHeader:TopHeaderUserView = {
        let uiview = TopHeaderUserView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
        return uiview
    }()
    
    private lazy var tableView:UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(UserDetailsTableViewCell.self, forCellReuseIdentifier: UserDetailsTableViewCell.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        self.tableView.rowHeight = 250//UITableView.automaticDimension;
        //self.tableView.estimatedRowHeight = 250.0;
        setData()
        
        scrollView.addSubview(userInfoHeader)
        scrollView.addSubview(tableView)
        
        if let userData = presenter?.presentUserData() {
            userInfoHeader.configureItemData(userData: userData)
        }
        configureLayout()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            userInfoHeader.topAnchor.constraint(equalTo: scrollView.topAnchor),
            userInfoHeader.widthAnchor.constraint(equalToConstant: view.bounds.width),
            tableView.topAnchor.constraint(equalTo: userInfoHeader.bottomAnchor,constant: 5),
            tableView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setData() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        presenter?
            .presentAlbumData()
            .subscribe(onNext: { album in
                DispatchQueue.main.async {
                    self.userAlbumDatas = album
                    dispatchGroup.leave()
                }
            })
            .disposed(by: disposable)
        
        dispatchGroup.enter()
        presenter?
            .presentPhotosData()
            .subscribe(onNext: { photos in
                DispatchQueue.main.async {
                    self.photosData = photos
                    dispatchGroup.leave()
                }
            })
            .disposed(by: disposable)
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            self.tableView.reloadData()
        }
    }
    
    private func navigateToPhotoDetail(photo:PhotoEntity) {
            let detailVC = PhotoDetailViewController()
            detailVC.setData(photo: photo)
            navigationController?.pushViewController(detailVC, animated: true)
    }

}

extension UserDetailViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userAlbumDatas.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Album \(userAlbumDatas[section].title)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailsTableViewCell.identifier, for: indexPath) as! UserDetailsTableViewCell
        cell.backgroundColor = .pumpkin
        let albumID = userAlbumDatas[indexPath.section].id
        let selectedPhotos = photosData.filter {$0.albumId == albumID}
        cell.configurePhotosData(photos: selectedPhotos)
        
        cell.cellDidTapped = { photo in
            print(photo)
            self.navigateToPhotoDetail(photo: photo)
        }
        return cell
    }
    
}

