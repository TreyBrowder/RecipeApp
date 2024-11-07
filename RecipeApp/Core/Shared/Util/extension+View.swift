//
//  extension+View.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import SwiftUI

extension View {
//MARK: CUSTOM NAV
    func hideBackButtonTitle() -> some View {
        self.modifier(CustomNav())
    }
    
//MARK: CUSTOM BUTTON
    public func customSmallBtn() -> some View {
        self.modifier(CustomBttn())
    }
}
