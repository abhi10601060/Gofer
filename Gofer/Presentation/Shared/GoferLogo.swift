//
//  GoferLogo.swift
//  Gofer
//
//  Created by Abhishek Velekar on 31/10/25.
//

import Foundation
import SwiftUI


struct GoferLogo: View {
    var size: CGFloat
    init(size: CGFloat = 100) {
        self.size = size
    }
    var body: some View {
        Image(systemName: "figure.walk.motion")
            .font(.system(size: size))
            .foregroundColor(.white)
            .padding(size/6)
            .background{
                ZStack{
                    LinearGradient(
                        gradient: Gradient(colors: [.theme, .darkPurple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
                .clipShape(RoundedRectangle(cornerRadius: size/3))
            }
    }
}

#Preview {
    GoferLogo()
}
