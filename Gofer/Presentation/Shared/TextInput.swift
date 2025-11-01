//
//  TextInput.swift
//  Gofer
//
//  Created by Abhishek Velekar on 31/10/25.
//

import SwiftUI

struct TextInput: View {
    @Binding var text: String
    var leadingIcon: String = ""
    var fontSize: CGFloat = 14
    var hint: String = ""

    var body: some View {
        HStack {
            ZStack {
                Image(systemName: leadingIcon)
                    .foregroundColor(.gray)
                    .font(.system(size: fontSize))

            }
            TextField(hint, text: $text)
                .font(.system(size: fontSize))
        }
        .padding(.vertical, fontSize)
        .padding(.horizontal, fontSize / 1.5)
        .background(.secondaryBG)
        .clipShape(RoundedRectangle(cornerRadius: fontSize / 1.2))

    }
}

#Preview {
    @Previewable @State var text: String = ""
    TextInput(
        text: $text,
        leadingIcon: "circle",
        fontSize: 16,
        hint: "Enter Email..."
    )
    .padding(20)
}
