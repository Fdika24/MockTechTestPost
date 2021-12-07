//
//  RootCoordinator.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import UIKit

protocol RootCoordinatorProtocol {
    
    var window: UIWindow? {get}
    var navigationVC:UINavigationController {get}
    func start()
}


final class RootCoordinator:RootCoordinatorProtocol {
    
    var navigationVC: UINavigationController = UINavigationController()
    var window: UIWindow?
    
    func start() {
        let dataSourcePost = PostsDataSource()
        let dataSourceUser = UserDataSource()
        let userInteractor = UserInteractor(userDataSource: dataSourceUser)
        let postInteractor = PostsInteractor(PostDataSource: dataSourcePost)
        let presenter = PostListPresenter(postsInteractor: postInteractor, userInteractor: userInteractor)
        let listPostVC = PostListViewController()
        listPostVC.presenter = presenter
        window?.rootViewController = navigationVC
        navigationVC.pushViewController(listPostVC, animated: true)
        window?.makeKeyAndVisible()
    }
    
    init(window:UIWindow) {
        self.window = window
    }
    
    
}
