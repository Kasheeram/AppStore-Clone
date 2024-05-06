//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by kashee on 07/01/24.
//

import UIKit


class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            createNavController(viewController: TodayController(), title: "Todays", imageName: "doc.text.image"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "square.stack.3d.up.fill"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "magnifyingglass")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController{
        viewController.view.backgroundColor = .systemBackground
        viewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.navigationBar.prefersLargeTitles = true
//        viewControllers?.append(navController)
        
        return navController
    }
}
