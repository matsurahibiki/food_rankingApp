//
//  Restaurant.swift
//  Food_ranking
//
//  Created by k20108kk on 2025/02/25.
//

import Foundation
import RealmSwift

class Restaurant: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var genre_id: String = ""
    @objc dynamic var location: String = ""
    // 開店時間
    @objc dynamic var open_time: String = ""
    // 閉店時間
    @objc dynamic var close_time: String = ""
//    @objc dynamic var rating: Int = 0       // 0~100
    @objc dynamic var image: Data = Data()
    @objc dynamic var comment: String = ""
    @objc dynamic var register_date: Date = Date()  // 保存した日時を記録
}


