//
//  TabButton.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/11/07.
//

import SwiftUI

struct TabButton: View {
    let title: String
    @Binding var selectedTab: String

    var body: some View {
        Button(action: {
            selectedTab = title
        }) {
            Text(title)
                .titleFont()
        }
    }
}
