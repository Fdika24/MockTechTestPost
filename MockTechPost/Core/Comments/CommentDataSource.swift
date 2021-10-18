//
//  CommentDataSource.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation
import RxSwift
import Alamofire

protocol CommentDataSourceProtocol {
    func getCommentDataSource(postId:Int) -> Observable <[CommentEntity]>
}


class CommentDataSource:CommentDataSourceProtocol {
    
    private let endPoint = EndPoint()
    
    func getCommentDataSource(postId: Int) -> Observable<[CommentEntity]> {
        return Observable.create {[weak self] observer in
            if let self = self {
                if let url = URL(string: self.endPoint.getCommentsEndPoint(postID: postId)) {
                    AF.request(url)
                        .validate()
                        .responseDecodable(of: [CommentEntity].self) { response in
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
