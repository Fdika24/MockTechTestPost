//
//  PostDetailHeader.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import UIKit

class PostDetailHeader: UITableViewHeaderFooterView {
    
    static let identifier = "postheader"
    
    var nameLabelTappedCallback:() -> () = {}
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 4
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    private lazy var getToKnowButton:UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.numberOfLines = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    
    private lazy var bodyLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 20
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureItems()
        getToKnowButton.addTarget(self, action: #selector(getToKnowTapped), for: .touchUpInside)
        
        
    }
    
    @objc private func getToKnowTapped() {
        nameLabelTappedCallback()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureItems() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(getToKnowButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            titleLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width-20),
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            getToKnowButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor,constant: 5),
            getToKnowButton.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            getToKnowButton.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor),
            getToKnowButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            
        ])
    }
    
    public func configureHeader(title:String,name:String,body:String) {
        self.titleLabel.text = title
        self.nameLabel.text = "by \(name)"
        self.getToKnowButton.setTitle("get to know \(name)", for: .normal)
        self.bodyLabel.text = body
    }
    
    
    
}
