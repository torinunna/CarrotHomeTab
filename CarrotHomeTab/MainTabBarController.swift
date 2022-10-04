//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by YUJIN KWON on 2022/10/03.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Hello", style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        
        delegate = self
    }
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        print("\(viewController) selected")
        
        switch viewController {
        case is HomeViewController:
            
            let titleConfig = CustomBarItemConfiguration(title: "한남동", handler: {})
            let customTitleView = CustomBarItem(config: titleConfig)
            let titleItem = UIBarButtonItem(customView: customTitleView)
            
//            let titleItem = UIBarButtonItem(title: "한남동", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
            
        case is MyTownViewController:
            let titleItem = UIBarButtonItem(title: "한남동", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
            
        case is ChatViewController:
            let titleItem = UIBarButtonItem(title: "채팅", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
            
        case is MyProfileViewController:
            let titleItem = UIBarButtonItem(title: "나의 당근", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        default:
            let titleItem = UIBarButtonItem(title: "당근", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        }
    }
}
