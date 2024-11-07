//
//  ErrorView.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import SwiftUI

struct ErrorView: View {
    var errorStr: String
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: "exclamationmark.octagon")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundStyle(.red)
            
            Text(errorStr)
                .font(.system(size: 26))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
        
    }
}

#Preview {
    ErrorView(errorStr: "error - Message")
}
