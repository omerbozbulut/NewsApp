//
//  SplashViewController.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import UIKit
import SnapKit
import UserNotifications

final class SplashViewController: UIViewController {

    let customView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .red
        return view
    }()

    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "News App"
        title.textColor = .white
        title.font = UIFont(name: Constants.Fonts.helveticaBOLD, size: 30)
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    func configure(){
        view.backgroundColor = .white

        view.addSubview(customView)
        customView.addSubview(titleLabel)

        configureConstraints()
        registerForRemoteNotification()
    }


//MARK: - Notification permission
    func registerForRemoteNotification() {
        if #available(iOS 10.0, *) {
            let center  = UNUserNotificationCenter.current()

            center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
                if error == nil{
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.tabBarConfigure()
                    }
                }
            }
        }
        else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
    }

//MARK: - Tab bar
    func tabBarConfigure(){
        let tabBarVC = UITabBarController()

        let newsVC = UINavigationController(rootViewController: NewsBuilder.build())
        let favoriteVC = UINavigationController(rootViewController: FavoriteNewsViewController())

        newsVC.title = "News"
        favoriteVC.title = "Favorite"

        tabBarVC.setViewControllers([newsVC,favoriteVC], animated: false)

        guard let items = tabBarVC.tabBar.items else {return}

        for img in 0..<Constants.tabBarImages.count{
            items[img].image = UIImage(systemName: Constants.tabBarImages[img])
        }

        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.tintColor = .red
        tabBarVC.tabBar.barTintColor = .white
        self.view.window?.rootViewController = tabBarVC
    }
}
