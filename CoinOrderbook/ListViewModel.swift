//
//  ListViewModel.swift
//  CoinOrderbook
//
//  Created by 박다혜 on 11/22/23.
//

import Foundation

class ListViewModel: ObservableObject {

    @Published var market: [Market] = []

    func load() {
        UpbitAPI.fetchAllMarket { [weak self] data in
            self?.market = data
        }
    }

}
