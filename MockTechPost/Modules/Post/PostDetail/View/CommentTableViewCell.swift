//
//  CommentTableViewCell.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    static let identifier = "comment"
    
    var nameTapped:() -> () = {} //ButtonCallback
    
    private lazy var namelabel:UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.numberOfLines = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var bodylabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 99
        label.textAlignment = .left
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(namelabel)
        contentView.addSubview(bodylabel)
        
        namelabel.addTarget(self, action: #selector(nameLabelDidTapped), for: .touchUpInside)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureItems(name:String,body:String) {
        self.namelabel.setTitle(name, for: .normal)
        self.bodylabel.text = body
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            namelabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            namelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            namelabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            namelabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width-20),
            
            bodylabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor,constant: 10),
            bodylabel.leadingAnchor.constraint(equalTo: namelabel.leadingAnchor),
            bodylabel.trailingAnchor.constraint(equalTo: namelabel.trailingAnchor),
            bodylabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
        ])
    }
    
    @objc private func nameLabelDidTapped() {
        nameTapped()
    }
    
}
