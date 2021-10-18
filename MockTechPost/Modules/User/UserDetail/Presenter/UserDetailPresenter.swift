//
//  UserDetailPresenter.swift
//  MockTechPost
//
//  Created by Farhandika on 17/10/21.
//

import Foundation
import RxSwift

protocol UserDetailPresenterProtocol {
    func presentUserData() -> UserEntity
    func presentAlbumData() -> Observable <[AlbumEntity]>
    func presentPhotosData() -> Observable <[PhotoEntity]>
}


class UserDetailPresenter:UserDetailPresenterProtocol {
    
    private let userData:UserEntity
    private let albumInteractor:AlbumInteractorProtocol
    private let photosInteractor:PhotosInteractorProtocol
    
    init(
        userData:UserEntity
        ,albumInteractor:AlbumInteractorProtocol
        ,photosInteractor:PhotosInteractorProtocol) {
            self.userData = userData
            self.albumInteractor = albumInteractor
            self.photosInteractor = photosInteractor
    }
    
    public func presentUserData() -> UserEntity {
        return self.userData
    }
    
    func presentAlbumData() -> Observable<[AlbumEntity]> {
        return self.albumInteractor.getAlbumData(userId: userData.id)
    }
    
    func presentPhotosData() -> Observable<[PhotoEntity]> {
        return self.photosInteractor.getPhotosData()
    }

    
    
}
