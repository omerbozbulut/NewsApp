//
//  SplashViewController.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen

        configure()
    }

    override func viewDidAppear(_ animated: Bool) {
        tabBarConfigure()
    }

    func configure(){

    }

    func tabBarConfigure(){
        let tabBarVC = UITabBarController()

        let newsVC = UINavigationController(rootViewController: NewsViewController())
        let favoriteVC = UINavigationController(rootViewController: FavoriteNewsViewController())

        newsVC.title = "News"
        favoriteVC.title = "Favorite"

        tabBarVC.setViewControllers([newsVC,favoriteVC], animated: false)

        guard let items = tabBarVC.tabBar.items else {return}

        for img in 0..<Constants.tabBarImages.count{
            items[img].image = UIImage(systemName: Constants.tabBarImages[img])
        }

        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.tintColor = .black
        self.view.window?.rootViewController = tabBarVC
    }
}
