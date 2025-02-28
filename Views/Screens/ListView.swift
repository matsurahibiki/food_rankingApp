//
//  CuisineTypeListView.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/10/26.
//

import SwiftUI

struct ListView: View {
    @State private var selectedTab = "store"
   @Namespace private var tabNamespace // Namespaceを定義

   var body: some View {
       VStack(spacing: 0) {
           // カスタムタブバー
           HStack {
               TabButton(title: "Store", isSelected: selectedTab == "store", namespace: tabNamespace) {
                   selectedTab = "store"
               }
               TabButton(title: "Dish", isSelected: selectedTab == "dish", namespace: tabNamespace) {
                   selectedTab = "dish"
               }
           }
           .frame(maxWidth: .infinity)
           .background(Color.white)
           .overlay(
               Divider()
                   .background(Color.gray.opacity(0.5)),
               alignment: .bottom
           )

           // 選択されたタブに応じて表示を切り替え
//           Spacer()
           if selectedTab == "store" {
               StoreListView()

           } else if selectedTab == "dish" {
               DishListView()
           }
//           Spacer()
       }
       .padding(0)
//       .background(Color(.systemGroupedBackground))
       .background(Color.white)
//       .edgesIgnoringSafeArea(.top)
   }
}

#Preview {
        ContentView()
//    ListView()
}
