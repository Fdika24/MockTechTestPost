//
//  PostInteractor.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation
import RxSwift

protocol PostsInteractorProtocol {
    
    func getPostsData() -> Observable<[PostEntity]>
}


class PostsInteractor:PostsInteractorProtocol {
    private let dataSource: PostsDataSource
    
    func getPostsData() -> Observable<[PostEntity]> {
        return dataSource.getPostsDataSource()
    }
    
    init(PostDataSource:PostsDataSource) {
        self.dataSource = PostDataSource
    }
    
    
}
