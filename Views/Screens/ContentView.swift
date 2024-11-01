//
//  ContentView.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/10/26.
//

import SwiftUI

struct ContentView: View {
    @State var selectedView = 0
    init() {
        let appearance = UITabBarAppearance()
        appearance.shadowColor = .red
        appearance.backgroundColor = UIColor.cyan
        UITabBar.appearance().standardAppearance = appearance
    }
    var body: some View {

        ZStack() {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("ホーム")
                    }
                    .tag(0)
                
                RankingView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Ranking")
                    }
                    .tag(1)
                
                DishListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("shop")
                    }
                    .tag(2)
            }
        }
    }
}

#Preview {
    ContentView()
}
