//
//  StoreListView.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/10/26.
//

import SwiftUI

struct StoreListView: View {
    let stores: [String: Store] = [
        "store1": Store(name: "渋谷カフェ", genre: "カフェ", location: "東京都渋谷区", hours: "9:00 - 18:00", rating: 85),
        "store2": Store(name: "大阪ラーメン", genre: "ラーメン", location: "大阪府北区", hours: "10:00 - 19:00", rating: 90),
        "store3": Store(name: "銀座寿司", genre: "寿司", location: "東京都中央区", hours: "11:00 - 22:00", rating: 95),
        "store4": Store(name: "京都カフェ", genre: "カフェ", location: "京都府京都市", hours: "8:00 - 17:00", rating: 80),
        "store5": Store(name: "福岡ラーメン", genre: "ラーメン", location: "福岡県福岡市", hours: "10:00 - 20:00", rating: 88)
    ]

    // Storeデータ構造
    struct Store {
        let name: String
        let genre: String
        let location: String
        let hours: String
        let rating: Int
    }


    var body: some View {
        List {
            // ジャンルごとに店舗をグループ化
            let groupedStores = Dictionary(grouping: stores.keys) { storeID in
                stores[storeID]?.genre ?? "不明"
            }

            // ジャンルごとのセクションを作成
            ForEach(groupedStores.keys.sorted(), id: \.self) { genre in
                Section(header: Text(genre)) {
                    if let storeIDs = groupedStores[genre] {
                        ForEach(storeIDs, id: \.self) { storeID in
                            if let store = stores[storeID] {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(store.name) // 店舗名
                                        .font(.headline)
                                    Text("所在地: \(store.location)")
                                        .font(.subheadline)
                                    Text("営業時間: \(store.hours)")
                                        .font(.subheadline)
                                    Text("評価: \(store.rating)/100")
                                        .font(.custom("Plus Jakarta Sans", size: 14).weight(.medium))
                                        .padding(.horizontal, 16)
                                        .frame(height: 32)
                                        .background(Color(red: 0.96, green: 0.94, blue: 0.90))
                                        .cornerRadius(16)
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.white)


    }
}

#Preview {
    ContentView()
//    StoreListView()
}
