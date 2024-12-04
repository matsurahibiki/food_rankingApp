//
//  reviewingView.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/11/26.
//

import SwiftUI

struct reviewingView: View {
    @State private var dish_card: [DishViewModel] =  [DishViewModel()]
    @State var selectedStore: Store = Store(name: "", genre: "", location: "", hours: "", rating: 100)
    @FocusState private var isFocused: Bool
    var body: some View {

        VStack(alignment: .center) {
            VStack(spacing: 0) {
                Text("店名 : \(selectedStore.name)")
                NavigationLink {
                    SelectStoreView(selectedStore: $selectedStore)
                } label: {
                    Text("店を選択")
                }
            }

            DatePicker("日付", selection: .constant(Date()), displayedComponents: .date)
                .padding()
            ScrollView {
                ForEach($dish_card.indices, id: \.self) { index in
                    DishCard(dish: $dish_card[index], isFocused: $isFocused)
                        .overlay{
                            Button(action: {
                                deleteDish(at: index)
                            }) {
                                Image(systemName: "trash")
                            }
                        }
                    Spacer()
                        .frame(height: 30)
                }
                HStack {
                    Button(action: {
                        addDish()
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding(.horizontal, 10)
                    Spacer()
                }
            }
        }
        .onTapGesture {
            isFocused = false
        }
    }

    // DishCard の削除処理
    private func deleteDish(at index: Int) {
        // もし配列の中に要素があれば削除
        if (dish_card.count > 1) {
            if dish_card.indices.contains(index) {
                dish_card.remove(at: index)
            }
        }
    }

    private func addDish() {
        // 最後に追加したDishのnameプロパティが空の場合は追加しない
        //        if (dish_card.count > 0) {
        //            if (dish_card[dish_card.count-1].name == "") {
        //                return
        //            }
        //        }
        dish_card.append(DishViewModel())
    }
}

#Preview {
    //    reviewingView()
    ContentView()
}
