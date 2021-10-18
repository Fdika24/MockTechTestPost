//
//  UserInteractor.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation
import RxSwift

protocol UserInteractorProtocol {
    func getUserDatas() -> Observable <[UserEntity]>
}

class UserInteractor:UserInteractorProtocol {
    
    private let dataSource:UserDataSourceProtocol
    
    init(userDataSource:UserDataSourceProtocol){
        self.dataSource = userDataSource
    }
    
    func getUserDatas() -> Observable <[UserEntity]> {
        return dataSource.getUserDataSource()
    }
}
