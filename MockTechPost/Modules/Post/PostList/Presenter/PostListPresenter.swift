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
    func presentUsers() -> Observable<[UserEntity]>
    func moveToDetailVC(postItem:PostEntity,userData:UserEntity) -> PostDetailViewController
}

class PostListPresenter:PostListPresenterProtocol {
    
    private let postsInteractor:PostsInteractorProtocol
    private let router:PostListRouterProtocol
    private let userInteractor:UserInteractorProtocol
    
    init(postsInteractor:PostsInteractorProtocol,userInteractor:UserInteractorProtocol){
        self.postsInteractor = postsInteractor
        self.userInteractor  = userInteractor
        self.router = PostListRouter()
    }
    
    func presentPostList() -> Observable<[PostEntity]> {
        return self.postsInteractor.getPostsData()
    }
    
    func presentUsers() -> Observable<[UserEntity]> {
        return self.userInteractor.getUserDatas()
    }
    
    func moveToDetailVC(postItem:PostEntity,userData:UserEntity) -> PostDetailViewController {
        let detailVC = self.router.getPostDetailVC()
        let commentDS = CommentDataSource()
        let commentInteractor = CommentInteractor(commentDataSource: commentDS)
        detailVC.presenter = PostDetailPresenter(postItem: postItem,userData: userData, commentInteractor: commentInteractor)
        return detailVC
    }
    
}
