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
    
    private let dependencyInjection:DependencyInjectionProtocol = DependencyInjection()
    
    var window: UIWindow?
    
    func start() {
        let dataSource = PostsDataSource()
        let interactor = PostsInteractor(PostDataSource: dataSource)
        let presenter = PostListPresenter(postsInteractor: interactor)
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
