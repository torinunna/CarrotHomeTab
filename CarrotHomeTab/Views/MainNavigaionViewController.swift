//
//  MainNavigaionViewController.swift
//  CarrotHomeTab
//
//  Created by YUJIN KWON on 2022/10/03.
//

import UIKit

class MainNavigaionViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIImage(systemName: "arrow.backward")
        navigationBar.backIndicatorImage = backButton
        navigationBar.backIndicatorTransitionMaskImage = backButton
        navigationBar.tintColor = .white
    }
    
}
