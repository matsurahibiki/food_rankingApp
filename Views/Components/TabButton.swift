//
//  TabButton.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/11/07.
//

import SwiftUI

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let namespace: Namespace.ID
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(isSelected ? .blue : .gray)
                if isSelected {
                    Capsule()
                        .fill(Color.blue)
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "underline", in: namespace)
                } else {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 3)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
