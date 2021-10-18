//
//  UserDataSource.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation
import RxSwift
import Alamofire


protocol UserDataSourceProtocol {
    func getUserDataSource() -> Observable<[UserEntity]>
}


class UserDataSource:UserDataSourceProtocol {
    private let endPoint = EndPoint()
    
    func getUserDataSource() -> Observable<[UserEntity]> {
        return Observable.create {[weak self] observer in
            if let self = self  {
                if let url = URL(string: self.endPoint.getUsersEndPoint()) {
                    AF.request(url)
                        .validate()
                        .responseDecodable(of: [UserEntity].self) { response in
                            switch response.result {
                            case .success(let data):
                                observer.onNext(data)
                                observer.onCompleted()
                            case .failure(_):
                                print(self.endPoint.getUsersEndPoint())
                                observer.onError(URLError.invalidResponse)
                            }
                        }
                }
            }
            return Disposables.create()
        }
    }
    
}
