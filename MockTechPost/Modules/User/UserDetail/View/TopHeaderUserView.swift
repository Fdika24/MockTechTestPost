//
//  TopHeaderUserView.swift
//  MockTechPost
//
//  Created by Farhandika on 17/10/21.
//

import UIKit

class TopHeaderUserView: UIView {
    
    private lazy var usernameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addressLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var companyLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(usernameLabel)
        self.addSubview(emailLabel)
        self.addSubview(addressLabel)
        self.addSubview(companyLabel)
        self.configureLayout()
        
    }
    //BISA PAKE STACKVIEW
    private func configureLayout() {
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            
            emailLabel.topAnchor.constraint(equalTo: self.usernameLabel.bottomAnchor,constant: 5),
            emailLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor,constant: 5),
            addressLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: addressLabel.trailingAnchor),
            
            companyLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor,constant: 5),
            companyLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            companyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5),
            
        ])
    }
    
    public func configureItemData(userData:UserEntity) {
        self.usernameLabel.text = "name     : \(userData.name)"
        self.emailLabel.text    = "Email    : \(userData.email)"
        self.companyLabel.text  = userData.company.name
        self.addressLabel.text  = userData.address.city
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
