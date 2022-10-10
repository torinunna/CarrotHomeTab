//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by YUJIN KWON on 2022/10/08.
//

import Foundation

final class DetailViewModel {
    
    let network: NetworkService
    let itemInfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(network: NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    func fetch() {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.3) { [unowned self] in
            self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: self.itemInfo, details: ItemExtraInfo.mock)
        }
//        let resource: Resource<ItemInfoDetails> = Resource(base: <#T##String#>, path: <#T##String#>, params: [:], header: [:])
//
//        network.load(resource)
//            .receive(on: RunLoop.main)
    }
}
