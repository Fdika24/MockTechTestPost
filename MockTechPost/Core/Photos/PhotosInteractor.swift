//
//  PhotosInteractor.swift
//  MockTechPost
//
//  Created by Farhandika on 18/10/21.
//

import Foundation
import RxSwift

protocol PhotosInteractorProtocol {
    func getPhotosData() -> Observable<[PhotoEntity]>
}


class PhotosInteractor: PhotosInteractorProtocol {
    private let photosDS:PhotosDataSourceProtocol
    
    init(photosDataSource:PhotosDataSourceProtocol) {
        self.photosDS = photosDataSource
    }
    
    func getPhotosData() -> Observable<[PhotoEntity]> {
        return self.photosDS.getPhotosDataSource()
    }
}
