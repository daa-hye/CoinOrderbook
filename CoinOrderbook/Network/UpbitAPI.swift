//
//  UpbitAPI.swift
//  CoinOrderbook
//
//  Created by 박다혜 on 11/22/23.
//

import Foundation

struct Market: Codable, Hashable {
    let market: String
    let koreanName: String
    let englishName: String

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}

struct UpbitAPI {
    private init() {}

    static func fetchAllMarket(completion: @escaping ([Market]) -> Void) {

        let url = URL(string: "https://api.upbit.com/v1/market/all")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)

                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
