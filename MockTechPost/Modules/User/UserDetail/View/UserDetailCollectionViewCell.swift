//
//  UserDetailCollectionViewCell.swift
//  MockTechPost
//
//  Created by Farhandika on 18/10/21.
//

import UIKit
import Kingfisher

class UserDetailCollectionViewCell: UICollectionViewCell {
    
    private lazy var image:UIImageView = UIImageView(frame: contentView.bounds)
    
    static let identifier = "collectionUser"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setImageData(imageLink:String) {
        self.image.kf.indicatorType = .activity
        let url = URL(string: imageLink)
        self.image.kf.setImage(with: url)
    }
}
