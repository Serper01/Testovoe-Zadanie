//
//  TabBarController.swift
//  Testovoe Zadanie
//
//  Created by Serper Kurmanbek on 04.06.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeVC = UINavigationController(rootViewController: MainPageViewController())
    let basketVC = UINavigationController(rootViewController: BasketViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup(){
        tabBar.backgroundColor = .white
        
//        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Courses"), selectedImage: UIImage(named: "SonyPS5"))
//        basketVC.tabBarItem =  UITabBarItem(title: "", image: UIImage(named: "SonyPS5"), selectedImage: UIImage(named: "SonyPS5"))
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        basketVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "basket"), selectedImage: UIImage(systemName: "basket.fill"))
        
        setViewControllers([homeVC,basketVC], animated: false)
    }

}
