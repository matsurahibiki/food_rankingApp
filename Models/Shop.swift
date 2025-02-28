//
//  Shop.swift
//  Food_ranking
//
//  Created by k20108kk on 2025/02/28.
//

import Foundation
import RealmSwift

/*
 保存した店のデータ用クラス
*/

class Shop_Realm: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String
    @objc dynamic var genre: String
    @objc dynamic var address: String = ""
    @objc dynamic var url: String = ""

    init(id: String = UUID().uuidString, name: String = "", genre: String = "その他", address: String = "", url: String = "") {
        self.id = id
        self.name = name
        self.genre = genre
        self.address = address
        self.url = url
    }
}

class Shop: Identifiable, Codable {
    var id = UUID()
    var name: String
    var genre: String
    var address: String
    var url: String
    // 画像

    init(id: UUID = UUID(), name: String = "", genre: String = "その他", address: String = "", url: String = "") {
        self.id = id
        self.name = name
        self.genre = genre
        self.address = address
        self.url = url
    }
}

