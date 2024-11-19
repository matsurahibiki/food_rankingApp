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
        appearance.backgroundColor = .white // 完全な白を指定
        UITabBar.appearance().standardAppearance = appearance   // 通常時の見た目を統一
        UITabBar.appearance().scrollEdgeAppearance = appearance // スクロール時の見た目も統一
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
                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("リスト")
                    }
                    .tag(2)
            }
//            .background(Color.white)
        }
    }
}

#Preview {
    ContentView()
}
