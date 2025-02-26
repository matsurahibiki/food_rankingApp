//
//  Genres.swift
//  Food_ranking
//
//  Created by k20108kk on 2025/02/25.
//

import Foundation
import RealmSwift

class Restaurant_Genres: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
}

let restaurantGenres = [
    "和食",
    "洋食",
    "中華料理",
    "イタリアン",
    "フレンチ",
    "エスニック料理",
    "ファストフード",
    "カフェ・喫茶店",
    "居酒屋",
    "バー",
    "ベーカリー",
    "スイーツ",
    "その他"
];
