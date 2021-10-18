//
//  UserDetailsTableViewCell.swift
//  MockTechPost
//
//  Created by Farhandika on 17/10/21.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: UserDetailCollectionViewCell?, index: Int, didTappedInTableViewCell: UserDetailsTableViewCell)
}

class UserDetailsTableViewCell: UITableViewCell {
    
    static let identifier = "userdetail"
    
    var cellDidTapped:(_ photo:PhotoEntity) -> () = { photo in print("taoped") }
    
    private var photosData:[PhotoEntity] = []
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView =  UICollectionView(
            frame: CGRect(x: 0, y: 0,
                          width: UIScreen.main.bounds.width,
                          height: 250),
            collectionViewLayout: layout)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.register(
            UserDetailCollectionViewCell.self,
            forCellWithReuseIdentifier: UserDetailCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePhotosData(photos:[PhotoEntity]) {
        self.photosData = photos
    }
}

extension UserDetailsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: UserDetailCollectionViewCell.identifier,
            for: indexPath) as! UserDetailCollectionViewCell
        let imageData = photosData[indexPath.row]
        cell.setImageData(imageLink: imageData.url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        cellDidTapped(photosData[indexPath.row])
    }
}
