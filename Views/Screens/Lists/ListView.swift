//
//  CuisineTypeListView.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/10/26.
//

import SwiftUI

struct ListView: View {
    @State private var selectedTab = "store"
    var body: some View {
        VStack {
            // 上部のカスタムタブバー
            HStack {
                TabButton(title: "store", selectedTab: $selectedTab)
                TabButton(title: "dish", selectedTab: $selectedTab)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)

            Spacer() // 上部にタブバーを固定するためのスペーサー

            // 選択されたタブに応じて表示するビューを切り替え
            if selectedTab == "store" {
                StoreListView()
            } else if selectedTab == "dish" {
                DishListView()
            }

            Spacer()
        }

    }
}

#Preview {
    //    ContentView()
    ListView()
}
