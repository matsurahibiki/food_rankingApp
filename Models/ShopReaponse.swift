//
//  ShopReaponse.swift
//  Food_ranking
//
//  Created by k20108kk on 2025/02/28.
//

import Foundation

struct ShopResponse: Codable {
    // Define the structure according to the API response
    let results_available: Int  // クエリー条件にマッチする、検索結果の全件数
    let results_returned: Int   // レスポンスに含まれる検索結果の件数
    let shops: [Shop]
}
