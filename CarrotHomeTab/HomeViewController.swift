//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by YUJIN KWON on 2022/10/02.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func ctaButtonPressed(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
