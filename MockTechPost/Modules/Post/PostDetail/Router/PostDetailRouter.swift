//
//  PostDetailRouter.swift
//  MockTechPost
//
//  Created by Farhandika on 17/10/21.
//

import Foundation

protocol PostDetailRouterProtocol {
    func getUserDetailVC(userData:UserEntity) -> UserDetailViewController
}


class PostDetailRouter:PostDetailRouterProtocol {
    
    func getUserDetailVC(userData:UserEntity) -> UserDetailViewController {
        let userDetailVC = UserDetailViewController()
        let albumDS = AlbumDataSource()
        let albumInteractor = AlbumInteractor(albumDataSource: albumDS)
        
        let photosDS = PhotosDataSource()
        let photosInteractor = PhotosInteractor(photosDataSource: photosDS)
        
        let userDetailPresenter = UserDetailPresenter(
            userData: userData
            ,albumInteractor: albumInteractor
            , photosInteractor: photosInteractor)
        userDetailVC.presenter = userDetailPresenter
        return userDetailVC
    }
    
    
}
