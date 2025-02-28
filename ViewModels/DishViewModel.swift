//
//  DishViewModel.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/12/04.
//

import Foundation

class DishViewModel: ObservableObject {
    @Published var id: String = UUID().uuidString
    @Published var name: String = ""
    @Published var price: Int = 0
    @Published var score: Double = 0
    @Published var comment: String = ""
    @Published var image: Data = Data()
    
    func update_name(name: String) {
        self.name = name
    }

    func update_price(price: Int) {
        self.price = price
    }

    func update_score(score: Double) {
        self.score = score
    }

    func update_comment(comment: String) {
        self.comment = comment
    }

    func update_image(image: Data) {
        self.image = image
    }
}
