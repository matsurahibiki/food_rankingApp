//
//  RankingView.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/10/26.
//

import SwiftUI

struct RankingView: View {
    let topRankedItems = ["Croissant 1", "Croissant 2", "Croissant 3", "Croissant 4", "Croissant 5"]
    //    let categoryList: Dictionary<String, [String]> = [
    //        "bread" : ["cream", "melon"],
    //        "ramen" : ["soy source", "miso"]
    //    ]
    let categoryList = ["bread", "ramen", "pasta", "pizza", "bread", "ramen", "pasta", "pizza"]
    @State private var selectedOption = 0
    var body: some View {
        ZStack {

            VStack(alignment: .leading, spacing: 0) {
                HStack (alignment: .center) {
                    VStack (alignment: .leading) {
                        HStack() {
                            Text("Ranking")
                            //                    .font(.custom("Plus Jakarta Sans", size: 22).weight(.bold))
                                .headingFont()
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            //                            .frame(alignment: .center)
                            Spacer()
                            Picker("選択してください", selection: $selectedOption) {
                                ForEach(categoryList.indices, id: \.self) { index in
                                    Text(categoryList[index]).tag(index)    // tagをカテゴリIDにする
                                    //ToDo tagの値が変更されたら動的に表示するランキングを変更
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        }
                    }

                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                ScrollView(.vertical, showsIndicators: false) {
                    //                    HStack {
                    ForEach(0..<5) { _ in
                        HStack {
                            ForEach(0..<2) { _ in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("トップ5ランキング")
                                        .subheadingFont()
                                        .frame(maxWidth: .infinity)
                                        .padding(0)
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
                                .shadow(color: Color.black.opacity(0.1), radius: 5)
                                .onTapGesture {
                                    // ここにタップ時のイベントを記述
                                    print("ランキングがタップされました")
                                }

                            }
                        }
                        .padding(5)
                    }
                    //                    }
                }
                .padding(8)
//                .background(Color.black.opacity(0.1))
            }
        }
    }
}

#Preview(body: {
    RankingView()
})

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
