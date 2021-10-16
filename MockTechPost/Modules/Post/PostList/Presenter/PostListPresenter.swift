//
//  PostListPresenter.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation
import RxSwift

protocol PostListPresenterProtocol {
    func presentPostList() -> Observable<[PostEntity]>
}

class PostListPresenter:PostListPresenterProtocol {
    
    private let interactor:PostsInteractorProtocol
    private let router:PostListRouterProtocol
    
    init(postsInteractor:PostsInteractorProtocol){
        self.interactor = postsInteractor
        self.router = PostListRouter()
    }
    
    func presentPostList() -> Observable<[PostEntity]> {
        return self.interactor.getPostsData()
    }
}
