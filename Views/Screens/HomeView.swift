//
//  HomeView.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/10/26.
//

import SwiftUI

struct HomeView: View {
    let topRankedItems = ["Croissant 1", "Croissant 2", "Croissant 3", "Croissant 4", "Croissant 5"]
    let recentImpressions = [
        (UUID().uuidString, "Melon Pan", "Crispy and sweet on the outside", "95/100"),
        (UUID().uuidString, "Curry Bread", "Rich flavor with a hint of spice", "90/100"),
        (UUID().uuidString, "Melon Pan", "Crispy and sweet on the outside", "95/100"),
        (UUID().uuidString, "Curry Bread", "Rich flavor with a hint of spice", "90/100"),
        (UUID().uuidString, "Melon Pan", "Crispy and sweet on the outside", "95/100"),
        (UUID().uuidString, "Curry Bread", "Rich flavor with a hint of spice", "90/100")
    ]
    let Image_height = UIScreen.main.bounds.width/5

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                HStack () {
                    Text("Ranking")
                    //                    .font(.custom("Plus Jakarta Sans", size: 22).weight(.bold))
                        .headingFont()
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    Spacer()
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<5) { _ in
                            VStack(alignment: .leading, spacing: 8) {
                                Text("トップ5ランキング")
                                //                        .font(.custom("Plus Jakarta Sans", size: 18).weight(.bold))
                                    .subheadingFont()
                                // .padding(.bottom, 4)
                                Divider()
                                ForEach(1...5, id: \.self) { rank in
                                    HStack {
                                        Text("\(rank)位")
                                        //                                .font(.custom("Plus Jakarta Sans", size: 16).weight(.medium))
                                            .bodyFont()
                                            .frame(width: 40, alignment: .leading)
                                        Text(topRankedItems[rank - 1])
                                        //                                .font(.custom("Plus Jakarta Sans", size: 16))
                                            .bodyFont()
                                    }
                                }
                            }
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
                            .onTapGesture {
                                // ここにタップ時のイベントを記述
                                print("ランキングがタップされました")
                            }
                        }
                    }
                }
                .padding(16)
                .background(Color.black.opacity(0.1))

                Divider()

                HStack() {
                    Text("Recent Impressions")
                    //                    .font(.custom("Plus Jakarta Sans", size: 22).weight(.bold))
                        .headingFont()
                        .padding(EdgeInsets(top: 4, leading: 16, bottom: 2, trailing: 16))
                    Spacer()
                }
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(recentImpressions, id: \.0) { item in
                            HStack(alignment: .top, spacing: 0) {
                                VStack(alignment: .leading, spacing: 5) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(item.1)
                                            .font(.custom("Plus Jakarta Sans", size: 16).weight(.bold))
                                        Text(item.2)
                                            .captionFont()
                                    }
                                    Text(item.3)
                                        .font(.custom("Plus Jakarta Sans", size: 14).weight(.medium))
                                        .padding(.horizontal, 16)
                                        .frame(height: 32)
                                        .background(Color(red: 0.96, green: 0.94, blue: 0.90))
                                        .cornerRadius(16)
                                }
                                .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.height/10)

                                Image(systemName: "fork.knife")  // フォークとナイフのシステムイメージを使用
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: Image_height*1.5, height: Image_height)
                                    .background(Color.gray.opacity(0.2))  // 背景色を追加してイメージを目立たせる
                                    .cornerRadius(12)
                            }
                            //                        .padding(4)
                        }
                    }
                    Spacer()
                }
                //            .background(Color.black.opacity(0.1))
                .frame(maxWidth: UIScreen.main.bounds.width*0.95) // ここを修正
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

            }
            .frame(maxWidth: .infinity)
            .background(.white)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//#Preview {
//    HomeView()
//}
