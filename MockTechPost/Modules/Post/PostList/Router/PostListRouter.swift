//
//  PostListRouter.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation

protocol PostListRouterProtocol {
    func getPostDetailVC() -> PostDetailViewController
}


class PostListRouter:PostListRouterProtocol {
    func getPostDetailVC() -> PostDetailViewController {
        return PostDetailViewController()
    }
    
    
}
