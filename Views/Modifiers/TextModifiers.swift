//
//  SwiftUIView.swift
//  Food_ranking
//
//  Created by k20108kk on 2024/10/26.
//

import SwiftUI

import Foundation
import SwiftUI

struct CaptionFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .regular, design: .default))
//            .foregroundColor(.gray)
            .foregroundColor(Color(red: 0.63, green: 0.51, blue: 0.29))

    }
}

struct BodyFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .regular, design: .default))
            .foregroundColor(.primary)
    }
}

struct SubheadingFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold, design: .default))
            .foregroundColor(.secondary)
    }
}

struct HeadingFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundColor(.primary)
    }
}

struct TitleFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30, weight: .bold, design: .default))
            .foregroundColor(.primary)
    }
}


extension View {
    func captionFont() -> some View {
        self.modifier(CaptionFontModifier())
    }

    func bodyFont() -> some View {
        self.modifier(BodyFontModifier())
    }

    func subheadingFont() -> some View {
        self.modifier(SubheadingFontModifier())
    }

    func headingFont() -> some View {
        self.modifier(HeadingFontModifier())
    }

    func titleFont() -> some View {
        self.modifier(TitleFontModifier())
    }
}

struct TextModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
