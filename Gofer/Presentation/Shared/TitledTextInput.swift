//
//  TitledTextInput.swift
//  Gofer
//
//  Created by Abhishek Velekar on 31/10/25.
//

import SwiftUI

struct TitledTextInput: View {
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

            TextInput(
                text: $text,
                leadingIcon: leadingIcon,
                fontSize: fontSize,
                hint: hint
            )

        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    @Previewable @State var text: String = ""
    TitledTextInput(
        title: "Email",
        text: $text,
        leadingIcon: "email",
        fontSize: 20,
        hint: "Enter Email"
    )
    .padding(10)
}
