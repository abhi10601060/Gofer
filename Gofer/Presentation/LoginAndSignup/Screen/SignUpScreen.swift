//
//  SignUpScreen.swift
//  Gofer
//
//  Created by Abhishek Velekar on 01/11/25.
//

import SwiftUI

struct SignUpScreen: View {

    @State var policyAgreed = false

    var body: some View {
        ZStack {
            VStack {
                AppLogoWithName()

                Text("Hey there!")
                    .font(.largeTitle.bold())
                    .padding(.top, 20)

                Text("Sign up to continue")
                    .foregroundColor(.gray)

                InputContainer

            }
            .padding(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primaryBG)
    }

    var InputContainer: some View {
        VStack {
            TitledTextInput(
                title: "Email",
                text: .constant(""),
                leadingIcon: "envelope",
                hint: "Enter Email here"
            )

            TitledTextInput(
                title: "Password",
                text: .constant(""),
                leadingIcon: "lock",
                hint: "Enter Password here"
            )
            .padding(.top, 15)

            TitledTextInput(
                title: "Confirm Password",
                text: .constant(""),
                leadingIcon: "lock",
                hint: "Enter Password again"
            )
            .padding(.top, 15)

            Toggle(isOn: $policyAgreed) {
                Text(attributedPolicyString)
                    .font(.caption)
                    
            }
            .toggleStyle(CheckboxToggleStyle())
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(5)

            Button(action: {

            }) {
                Text("Sign Up")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.all, 12)
                    .background(.theme)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 10)
                    .opacity(policyAgreed ? 1 : 0.6)
            }
            .padding(.top, 20)
            
            HStack(alignment: .center, spacing: 10) {
                Spacer()
                    .frame(height: 1)
                    .background(.gray)

                Text("or continue with")
                    .layoutPriority(1)
                    .font(.callout)
                    .fontWeight(.light)

                Spacer()
                    .frame(height: 1)
                    .background(.gray)
            }.padding(10)
                .padding(.top, 8)

            HStack(alignment: .center) {
                LoginOptionTag(imageName: "applelogo", title: "Apple")
                Spacer()
                LoginOptionTag(imageName: "globe.fill", title: "Google")
            }
            .padding(10)

        }
    }

    var attributedPolicyString: AttributedString {
        var str = AttributedString(
            "I agree to the Gofer's Privacy Policy and Terms and Services"
        )

        if let range = str.range(of: "Privacy Policy") {
            str[range].foregroundColor = .theme
        }

        if let range = str.range(of: "Terms and Services") {
            str[range].foregroundColor = .theme
        }

        return str
    }

}

#Preview {
    SignUpScreen()
}
