//
//  PostListTableViewCell.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import UIKit

class PostListTableViewCell: UITableViewCell {
    
    private lazy var titleLabel:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var authorLabel:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var companyNameLabel:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var bodyLabel:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 5
        return label
    }()
    
    static let identifier:String = "postlist"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(companyNameLabel)
        contentView.addSubview(bodyLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //230 - 50 - 30
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            titleLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 3),
            authorLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 20),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            //authorLabel.heightAnchor.constraint(equalToConstant: 30),
            
            companyNameLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,constant: 3),
            companyNameLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 20),
           // companyNameLabel.heightAnchor.constraint(equalToConstant: 30),
            companyNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            companyNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            
            bodyLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor,constant: 3),
            bodyLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 20),
            bodyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
        ])
    }
    
    public func configureCell(title:String,name author:String,companyName:String,body:String) {
        self.titleLabel.text = "Title : \(title)"
        self.authorLabel.text = "Author : \(author)"
        self.companyNameLabel.text = "Company : \(companyName)"
        self.bodyLabel.text = body
    }
    

}
