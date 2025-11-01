//
//  SignUpScreen.swift
//  Gofer
//
//  Created by Abhishek Velekar on 01/11/25.
//

import SwiftUI

struct SignUpScreen: View {

    @StateObject var viewModel: SignupViewModel = SignupViewModel()

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

                    .alert(isPresented: $viewModel.showErrorAlert) {
                        Alert(
                            title: Text("Input Error"),
                            message: Text(viewModel.errorDescription),
                            dismissButton: .default(
                                Text("Try again"),
                                action: { viewModel.showErrorAlert = false }
                            )
                        )
                    }
            }
            .padding(10)
            
            if viewModel.isLoading {
                ProgressView("Signing up...")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primaryBG)
    }

    var InputContainer: some View {
        VStack {
            TitledTextInput(
                title: "Email",
                text: $viewModel.email,
                leadingIcon: "envelope",
                hint: "Enter Email here"
            )

            TitleSecuredInput(
                title: "Password",
                text: $viewModel.password,
                leadingIcon: "lock",
                hint: "Enter Password here"
            )
            .padding(.top, 15)

            TitleSecuredInput(
                title: "Confirm Password",
                text: $viewModel.confirmPassword,
                leadingIcon: "lock",
                hint: "Enter Password again"
            )
            .padding(.top, 15)

            Toggle(isOn: $viewModel.isPolicyAccepted) {
                Text(attributedPolicyString)
                    .font(.caption)

            }
            .toggleStyle(CheckboxToggleStyle())
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(5)

            Button(action: {
                if viewModel.isPolicyAccepted {
                    viewModel.signUp()
                }
            }) {
                Text("Sign Up")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.all, 12)
                    .background(.theme)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 10)
                    .opacity(viewModel.isPolicyAccepted ? 1 : 0.6)
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
