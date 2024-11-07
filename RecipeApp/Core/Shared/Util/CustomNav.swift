//
//  CustomNav.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import SwiftUI

struct CustomNav: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
                appearance.backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}
