//
//  ViewModel.swift
//  CarrotHomeTab
//
//  Created by YUJIN KWON on 2022/10/06.
//

import Foundation
import Combine

final class HomeViewModel {
    
    let network: NetworkService
    
    @Published var items: [ItemInfo] = []
    var subscriptions = Set<AnyCancellable>()
    
    let itemPressed = PassthroughSubject<ItemInfo, Never>()
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func fetch() {
        let resource: Resource<[ItemInfo]> = Resource(
            base: "https://my-json-server.typicode.com/",
            path: "cafielo/demo/products",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
     
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("---> error: \(error)")
                case .finished:
                    print("---> finished")
                }
            } receiveValue: { items in
                self.items = items
            }.store(in: &subscriptions)
    }
}
