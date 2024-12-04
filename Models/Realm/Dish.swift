//
//  dish_review.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/11/28.
//

import Foundation
import RealmSwift

//struct Dish: Identifiable {
//    var id = UUID()
//    var name: String
//    var price: Int
//    var score: Double
//    var comment: String
//    // 画像
//    var image: Data = Data()
//}


class Dish: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int = 0
    @objc dynamic var score: Double = 0
    @objc dynamic var comment: String = ""
    @objc dynamic var image: Data = Data()
}
