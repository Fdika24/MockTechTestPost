//
//  PhotosDataSource.swift
//  MockTechPost
//
//  Created by Farhandika on 18/10/21.
//

import Foundation
import RxSwift
import Alamofire

protocol PhotosDataSourceProtocol {
    func getPhotosDataSource() -> Observable <[PhotoEntity]>
}


class PhotosDataSource:PhotosDataSourceProtocol {
    
    let endPoint = EndPoint()
    func getPhotosDataSource() -> Observable<[PhotoEntity]> {
        return Observable.create {[weak self] observer in
            if let self = self {
                if let url = URL(string: self.endPoint.getPhotosEndPoint()) {
                    AF.request(url)
                        .validate()
                        .responseDecodable(of: [PhotoEntity].self) { response in
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
