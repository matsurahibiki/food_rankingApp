//
//  Register_RestaurantView.swift
//  Food_ranking
//
//  Created by k20108kk on 2025/02/25.
//

import SwiftUI

/*
 入力する情報
 ・画像
 ・店名
 ・ジャンル（選択）
 ・住所
 ・メモ
 */

struct Register_RestaurantView: View {
    @State private var name: String = ""
    @State private var genre_id: String = ""
    @State private var location: String = ""
    @State private var memo: String = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                HStack() {
                    TextField("店名", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    NavigationLink(destination: Text("遷移先")) {
                        Text("検索")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                TextField("メモ", text: $memo, axis: .vertical)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height / 5, alignment: .topLeading)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 3)
                    )
                    .padding()
                HStack {
                    Text("ジャンル")
                    Spacer()
                    Picker("ジャンル", selection: .constant(1)) {
                        Text("和食").tag(1)
                        Text("洋食").tag(2)
                        Text("中華").tag(3)
                        Text("イタリアン").tag(4)
                        Text("フレンチ").tag(5)
                        Text("アジアン").tag(6)
                        Text("カフェ").tag(7)
                        Text("ファーストフード").tag(8)
                        Text("その他").tag(9)
                    }

                }
            }

        }
    }
}

#Preview {
    Register_RestaurantView()
}
