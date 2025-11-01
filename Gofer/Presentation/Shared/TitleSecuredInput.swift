//
//  TitleSecuredInput.swift
//  Gofer
//
//  Created by Abhishek Velekar on 01/11/25.
//

import SwiftUI

struct TitleSecuredInput: View {
    var title: String
    @Binding var text: String
    var leadingIcon: String = ""
    var fontSize: CGFloat = 16
    var hint: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(Font.callout)
                .padding(.leading, 5)

            SecuredTextInput(
                text: $text,
                leadingIcon: leadingIcon,
                fontSize: fontSize,
                hint: hint
            )

        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SecuredTextInput: View {
    @Binding var text: String
    var leadingIcon: String = ""
    var fontSize: CGFloat = 14
    var hint: String = ""
    @State var isVisible: Bool = false

    var body: some View {
        HStack {
            Image(systemName: leadingIcon)
                .foregroundColor(.gray)
                .font(.system(size: fontSize))

            Group {
                if isVisible {
                    TextField(hint, text: $text)
                        .font(.system(size: fontSize))
                } else {
                    SecureField(hint, text: $text)
                        .font(.system(size: fontSize))
                        .padding(.top, 2)  // added padding beacuse secureField has less height than textField
                }
            }

            Image(systemName: isVisible ? "eye.slash" : "eye")
                .foregroundColor(.gray)
                .font(.system(size: fontSize))
                .onTapGesture {
                    isVisible.toggle()
                }
        }
        .padding(.vertical, fontSize)
        .padding(.horizontal, fontSize / 1.5)
        .background(.secondaryBG)
        .clipShape(RoundedRectangle(cornerRadius: fontSize / 1.2))
    }
}

#Preview {
    @Previewable @State var text: String = ""
    TitleSecuredInput(
        title: "Email",
        text: $text,
        leadingIcon: "mail",
        fontSize: 20,
        hint: "Enter Email"
    )
    .padding(10)
}
