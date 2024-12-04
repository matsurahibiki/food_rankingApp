//
//  DishCard.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/11/26.
//

import SwiftUI

struct DishCard: View {
    @Binding var dish: DishViewModel
    @FocusState.Binding var isFocused: Bool
    @State var selectedGenre: String = "和食"
    @State var selectedSubgenre: String = "その他"
    var genres: [String] = ["和食", "洋食", "中華", "イタリアン", "フレンチ", "アジアン", "カフェ", "ファーストフード", "その他"]
    var subgenres: [String] = ["和食", "洋食", "中華", "イタリアン", "フレンチ", "アジアン", "カフェ", "ファーストフード", "その他"]

    var body: some View {

        GeometryReader { geometry in
            VStack(alignment: .center) {
                VStack {
                    HStack {
                        VStack {
                            Picker("ジャンル", selection: $selectedGenre) {
                                ForEach(genres, id: \.self) { genre in
                                    Text(genre).tag(genre)
                                }
                            }
                            Picker("サブジャンル", selection: $selectedSubgenre) {
                                ForEach(subgenres, id: \.self) { genre in
                                    Text(genre).tag(genre)
                                }
                            }
                        }
                        TextField("料理名", text: $dish.name)
                            .focused($isFocused)
                            .padding(5)
                            .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.gray, lineWidth: 1))
                            .padding()
                    }
                    HStack {
                        Text("点数")
                        Spacer()
                        Slider(value: $dish.score, in: 0...100, step: 1)
                        TextField("0", value: $dish.score, formatter: NumberFormatter())
                            .focused($isFocused)
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 45)
                            .keyboardType(.numberPad)
//                            .onChange(of: dish.score) {
//                                dish.score = checkIfValid_score(inputText: String(dish.score))
//                            }
                    }
                    .padding()

                    HStack {
                        Text("値段")
                        TextField("0", value: $dish.price, formatter: NumberFormatter())
                            .focused($isFocused)
                            .focused($isFocused)
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 70)
                            .keyboardType(.numberPad)
                        Text("円")
                    }
                    TextField("レビュー", text: $dish.comment, axis: .vertical)
                        .padding(5)
                        .focused($isFocused)
                        .frame(width: geometry.size.width*0.9, height: 50)
                        .cornerRadius(10)
                        .border(Color.gray, width: 1)

                        .padding()
                }
                .padding(3)
                .frame(width: UIScreen.main.bounds.width*0.9)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.3)
    }
    // 入力値が0〜100の範囲の整数かどうかをチェックするメソッド
    private func checkIfValid_score(inputText: String) ->Double {
        // 入力値を整数に変換
        if let number = Int(inputText){
            // 整数が0〜100の範囲内かチェック
            if(number < 0) {
                return 0;
            } else if (number > 100) {
                return 100;
            } else {
                return Double(number)
            }
        }
        return 100;
    }

    private func checkIfValid_price(inputText: String) ->Int {
        // 入力値を整数に変換
        if let number = Int(inputText){
            // 整数が0〜100の範囲内かチェック
            if(number < 0) {
                return 0;
            } else {
                return Int(number)
            }
        }
        return 0;
    }

}

#Preview {
//    DishCard(dish: .constant(Dish(name: "", price: 1000, score: 100, comment: "")), isFocused: .constant(false))
    ContentView()
}
