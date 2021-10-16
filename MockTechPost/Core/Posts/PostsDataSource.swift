//
//  PostDataSource.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation
import Alamofire
import RxSwift

protocol PostsDataSourceProtocol {
    func getPostsDataSource() -> Observable<[PostEntity]>
}

class PostsDataSource:PostsDataSourceProtocol {
    private let endPoint:EndPoint = EndPoint()
    
    func getPostsDataSource() -> Observable<[PostEntity]> {
        return Observable.create { [weak self] observer in
            if let self = self {
                if let url = URL(string: self.endPoint.getPostsEndPoint()) {
                    AF.request(url)
                        .validate()
                        .responseDecodable(of: [PostEntity].self) { response in
                            switch response.result {
                            case .success(let data):
                                observer.onNext(data)
                                observer.onCompleted()
                            case .failure(_):
                                print(self.endPoint.getPostsEndPoint())
                                observer.onError(URLError.invalidResponse)
                            }
                        }
                }
            }
            return Disposables.create()
        }
    }
    
}
