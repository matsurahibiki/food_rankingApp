//
//  dish_review.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/11/28.
//

import Foundation

struct Dish: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
    var score: Double
    var comment: String
    // 画像
    var image: Data = Data()
}
