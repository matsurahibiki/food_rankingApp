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
    /*
        プロパティ
        id: ユニークなID
        name: 料理名
        price: 価格(Int)
        score: 点数(Int)　0~100
        comment: コメント
        image: 画像
     */
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int = 0
    @objc dynamic var Int: Double = 0
    @objc dynamic var comment: String = ""
    @objc dynamic var image: Data = Data()
}
