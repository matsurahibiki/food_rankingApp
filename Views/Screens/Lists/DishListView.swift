import SwiftUI

struct DishListView: View {
    // 店IDをキー、店名を値とする辞書
    let stores: [Int: String] = [
        1: "Italian Bistro",
        2: "Sushi Place",
        3: "Burger Joint"
    ]

    // カテゴリIDをキー、カテゴリ名を値とする辞書
    let categories: [Int: String] = [
        1: "Pizza",
        2: "Pasta",
        3: "Sushi",
        4: "Burgers",
        5: "Sides"
    ]

    // サブカテゴリIDをキー、(サブカテゴリ名, カテゴリID)を値とする辞書
    let subcategories: [Int: (name: String, categoryID: Int)] = [
        1: (name: "Neapolitan Pizza", categoryID: 1),
        2: (name: "Roman Pizza", categoryID: 1),
        3: (name: "Spaghetti", categoryID: 2),
        4: (name: "Sushi Roll", categoryID: 3),
        5: (name: "Cheeseburger", categoryID: 4)
    ]

    // 料理IDをキー、店ID、料理名、点数（rating）、サブカテゴリIDを値とする辞書
    let dishes: [Int: (storeID: Int, name: String, rating: Int, subcategoryID: Int)] = [
        1: (storeID: 1, name: "Margherita Pizza", rating: 5, subcategoryID: 1),
        2: (storeID: 1, name: "Pasta Carbonara", rating: 4, subcategoryID: 3),
        3: (storeID: 2, name: "Salmon Nigiri", rating: 5, subcategoryID: 4),
        4: (storeID: 2, name: "Tuna Roll", rating: 4, subcategoryID: 4),
        5: (storeID: 3, name: "Cheeseburger", rating: 3, subcategoryID: 5),
        6: (storeID: 3, name: "Fries", rating: 4, subcategoryID: 5),
        7: (storeID: 3, name: "Onion Rings", rating: 3, subcategoryID: 5),
        8: (storeID: 3, name: "Milkshake", rating: 5, subcategoryID: 5),
        9: (storeID: 3, name: "Veggie Burger", rating: 4, subcategoryID: 5),
        10: (storeID: 3, name: "Chicken Sandwich", rating: 4, subcategoryID: 5),
        11: (storeID: 3, name: "Fish Sandwich", rating: 3, subcategoryID: 5),
        12: (storeID: 3, name: "Chicken Nuggets", rating: 4, subcategoryID: 5),
        13: (storeID: 3, name: "Fish and Chips", rating: 5, subcategoryID: 5),
        14: (storeID: 2, name: "Grilled Cheese", rating: 4, subcategoryID: 5),
        15: (storeID: 2, name: "Veggie Sushi", rating: 3, subcategoryID: 4),
        16: (storeID: 2, name: "California Roll", rating: 5, subcategoryID: 4),
        17: (storeID: 2, name: "Dragon Roll", rating: 4, subcategoryID: 4),
        18: (storeID: 1, name: "Rainbow Roll", rating: 5, subcategoryID: 4),
        19: (storeID: 1, name: "Spaghetti Bolognese", rating: 4, subcategoryID: 3),
        20: (storeID: 1, name: "Fettuccine Alfredo", rating: 5, subcategoryID: 3)
    ]

    @State private var selectedCategory: Int? = nil
    @State private var selectedSubcategory: Int? = nil

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("カテゴリ")
                        .subheadingFont()
                        .padding(EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 16))
                    Spacer()
                    // カテゴリ選択のピッカー
                    Picker("カテゴリー", selection: $selectedCategory) {
                        Text("All Categories").tag(nil as Int?) // すべてのカテゴリを表示
                        ForEach(categories.keys.sorted(), id: \.self) { categoryID in
                            if let categoryName = categories[categoryID] {
                                Text(categoryName).tag(categoryID as Int?)
                            }
                        }
                    }
                    .foregroundColor(selectedCategory == nil ? .gray : .white) // カテゴリが選択されていない場合はグレー
//                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .onChange(of: selectedCategory) {
                        // カテゴリが変更されたときにサブカテゴリをリセット
                        selectedSubcategory = nil
                    }
                }

                HStack {
                    Text("サブカテゴリ")
                        .subheadingFont()
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    // サブカテゴリ選択のピッカー
                    Spacer()
                    Picker("サブカテゴリー", selection: $selectedSubcategory) {
                        Text("All Subcategories").tag(nil as Int?) // すべてのサブカテゴリを表示
                        ForEach(subcategories.keys.sorted(), id: \.self) { subcategoryID in
                            if let subcategory = subcategories[subcategoryID],
                               selectedCategory == subcategory.categoryID {
                                Text(subcategory.name).tag(subcategoryID as Int?)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .disabled(selectedCategory == nil) // カテゴリがAll Categoriesの場合に無効化
                }
            }

            List {

                // 店ごとの料理リスト表示
                ForEach(stores.keys.sorted(), id: \.self) { storeID in
                    if let storeName = stores[storeID] {
                        // 選択されたカテゴリとサブカテゴリに基づいて料理をフィルタリング
                        let filteredDishes = dishes.filter { dish in
                            dish.value.storeID == storeID &&
                            (selectedCategory == nil || (subcategories[dish.value.subcategoryID]?.categoryID == selectedCategory!)) &&
                            (selectedSubcategory == nil || dish.value.subcategoryID == selectedSubcategory!)
                        }

                        // フィルタリングされた料理がある場合にのみ、店を表示
                        if !filteredDishes.isEmpty {
                            Section(header: Text(storeName)) {
                                if (filteredDishes.isEmpty) {
                                    Text("No dishes found")
                                } else {

                                    ForEach(filteredDishes.sorted(by: { $0.key < $1.key }), id: \.key) { _, dish in
                                        HStack {
                                            Text(dish.name) // タプルの名前
                                            Spacer()
                                            Text("\(dish.rating)/100") // タプルの評価
                                                .font(.custom("Plus Jakarta Sans", size: 14).weight(.medium))
                                                .padding(.horizontal, 16)
                                                .frame(height: 32)
                                                .background(Color(red: 0.96, green: 0.94, blue: 0.90))
                                                .cornerRadius(16)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .background(Color.white)
        }
    }
}


struct DishListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    //    ContentView()
    DishListView()
}
