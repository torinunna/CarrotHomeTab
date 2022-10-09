//
//  DetailViewController.swift
//  CarrotHomeTab
//
//  Created by YUJIN KWON on 2022/10/02.
//

import UIKit
import Combine
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var userThumbnail: UIImageView!
    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userTemperature: UILabel!
    
    @IBOutlet weak var itemThumbnail: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    var viewModel: DetailViewModel!
    var subscriptions = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        bind()
        viewModel.fetch()
    }
    
    private func bind() {
        viewModel.$itemInfoDetails
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.userThumbnail.kf.setImage(with: URL(string: details.user.thumnail))
                self.userNickName.text = details.user.name
                self.userLocation.text = details.user.location
                self.userTemperature.text = "\(details.user.temperature)°C"
                
                self.itemThumbnail.kf.setImage(with: URL(string: details.item.thumbnailURL))
                self.itemTitle.text = details.item.title
                self.itemDescription.text = details.details.descriptions
                
                
            }.store(in: &subscriptions)
    }
    
    private func configureNavigationBar() {
    
        let moreConfig = CustomBarItemConfiguration(
            image: UIImage(systemName: "ellipsis"),
            handler: { print("--> more pressed") }
        )
        let moreItem = UIBarButtonItem.generate(with: moreConfig, width: 30)
        
        let shareConfig = CustomBarItemConfiguration(
            image: UIImage(systemName: "square.and.arrow.up"),
            handler: { print("--> share pressed") }
        )
        let shareItem = UIBarButtonItem.generate(with: shareConfig, width: 30)
        
        navigationItem.rightBarButtonItems = [moreItem, shareItem]
        navigationItem.backButtonDisplayMode = .minimal
        
    }

}

