//
//  hotpapper_api.swift
//  Food_ranking
//
//  Created by k20108kk on 2025/02/28.
//

import Foundation

func fetchShopData(completion: @escaping (Result<ShopResponse, Error>) -> Void) {
    let urlString = "http://webservice.recruit.co.jp/hotpepper/shop/v1/"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
            return
        }

        do {
            let shopResponse = try JSONDecoder().decode(ShopResponse.self, from: data)
            completion(.success(shopResponse))
        } catch {
            completion(.failure(error))
        }
    }

    task.resume()
}
