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

        NavigationStack() {
            ZStack() {
                TabView(selection: $selectedView) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("ホーム")
                        }
                        .tag(0)
//                    Text("登録")
//                        .tabItem {
//                            Image(systemName: "plus")
//
//                            Text("登録")
//                        }
//                        .tag(3)

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
            .toolbar{
                if (selectedView == 1) {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("ボタンがタップされました")
                        }) {
                            Image(systemName: "minus")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("ボタンがタップされました")
                    }) {
//                        Image(systemName: "plus")
                        Text("登録")
                            .padding(0)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
