//
//  PostDetailPresenter.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation
import RxSwift

protocol PostDetailPresenterProtocol {
    func getTitle() -> String
    func getUserName() -> String
    func getBody() -> String
    func getCommentList()->Observable<[CommentEntity]>
    func gotoUserDetail() -> UserDetailViewController
}


class PostDetailPresenter:PostDetailPresenterProtocol {
    
    private let postItem:PostEntity
    private let user:UserEntity
    private let commentInteractor:CommentInteractorProtocol
    private let router:PostDetailRouterProtocol = PostDetailRouter()
    
    init(postItem:PostEntity,userData:UserEntity,commentInteractor:CommentInteractorProtocol){
        self.postItem = postItem
        self.user = userData
        self.commentInteractor = commentInteractor
    }
    
    func getTitle() -> String {
        return self.postItem.title
    }
    
    func getUserName() -> String {
        return self.user.name
    }
    
    func getBody() -> String {
        return self.postItem.body
    }
    
    private func getPostId() -> Int {
        return self.postItem.id
    }
    
    func getCommentList()->Observable<[CommentEntity]>{
        return self.commentInteractor.getCommentData(postId: self.getPostId())
    }
    
    func gotoUserDetail() -> UserDetailViewController {
        return self.router.getUserDetailVC(userData: user)
    }
    
}
