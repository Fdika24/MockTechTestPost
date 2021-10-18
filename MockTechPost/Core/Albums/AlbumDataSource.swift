//
//  AlbumDataSource.swift
//  MockTechPost
//
//  Created by Farhandika on 17/10/21.
//

import Foundation
import RxSwift
import Alamofire

protocol AlbumDataSourceProtocol {
    func getAlbumDataSource(userId:Int) -> Observable<[AlbumEntity]>
}

class AlbumDataSource:AlbumDataSourceProtocol {
    
    private let endPoint = EndPoint()
    
    func getAlbumDataSource(userId: Int) -> Observable<[AlbumEntity]> {
        return Observable.create { [weak self] observer in
            if let self = self {
                if let url = URL(string: self.endPoint.getAlbumsEndPoint(userId: userId)) {
                    AF.request(url)
                        .validate()
                        .responseDecodable(of: [AlbumEntity].self) { response in
                            switch response.result {
                                
                            case .success(let data):
                                observer.onNext(data)
                                observer.onCompleted()
                            case .failure(_):
                                observer.onError(URLError.invalidResponse)
                            }
                        }
                }
            }
            return Disposables.create()
        }
    }
    
}
