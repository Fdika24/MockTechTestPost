//
//  CommentInteractor.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation
import RxSwift

protocol CommentInteractorProtocol {
    func getCommentData(postId:Int) -> Observable<[CommentEntity]>
}


class CommentInteractor:CommentInteractorProtocol {
    private let dataSource: CommentDataSourceProtocol
    
    init(commentDataSource:CommentDataSourceProtocol){
        self.dataSource = commentDataSource
    }
    
    func getCommentData(postId: Int) -> Observable<[CommentEntity]> {
        return dataSource.getCommentDataSource(postId: postId)
    }
    
    
}
