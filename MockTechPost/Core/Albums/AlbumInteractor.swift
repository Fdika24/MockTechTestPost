//
//  AlbumInteractor.swift
//  MockTechPost
//
//  Created by Farhandika on 17/10/21.
//

import Foundation
import RxSwift

protocol AlbumInteractorProtocol {
    func getAlbumData(userId:Int) -> Observable <[AlbumEntity]>
}

class AlbumInteractor:AlbumInteractorProtocol {
    private let albumDS:AlbumDataSourceProtocol
    
    init(albumDataSource:AlbumDataSourceProtocol) {
        self.albumDS = albumDataSource
    }
    
    func getAlbumData(userId: Int) -> Observable<[AlbumEntity]> {
        return albumDS.getAlbumDataSource(userId: userId)
    }
}
