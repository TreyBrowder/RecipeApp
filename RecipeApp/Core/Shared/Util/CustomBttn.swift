//
//  CustomBttn.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation
import SwiftUI

struct CustomBttn: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22))
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .foregroundStyle(.white)
            .background(Color.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    public func customSmallBtn() -> some View {
        self.modifier(CustomBttn())
    }
}
