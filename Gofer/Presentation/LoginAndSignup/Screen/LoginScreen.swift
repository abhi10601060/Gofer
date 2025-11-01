//
//  LoginScreen.swift
//  Gofer
//
//  Created by Abhishek Velekar on 31/10/25.
//

import SwiftUI

struct LoginScreen: View {

    var body: some View {
        ZStack {
            VStack {
                AppLogoWithName()

                Text("Welcome Back")
                    .font(.largeTitle.bold())
                    .padding(.top, 20)

                Text("Sign in to continue")
                    .foregroundColor(.gray)

                InputContainer

            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .all)
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

            HStack {
                Spacer()
                Text("Forgot Password?")
                    .font(Font.footnote.bold())
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 5)

            Button(action: {

            }) {
                Text("Sign In")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.all, 12)
                    .background(.theme)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 10)
            }

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

            HStack(spacing: 1) {
                Text("Don't hyave an account? ")
                    .foregroundColor(.black.opacity(0.8))
                    .fontWeight(.light)
                NavigationLink("Sign Up", destination: {SignUpScreen()})
            }
            .padding(.top, 20)

        }
        .padding(10)
    }
}

struct AppLogoWithName: View {
    var body: some View {
        VStack {
            GoferLogo(size: 40)
            Spacer()
                .frame(height: 8)
            Text("GoFer")
                .font(Font.title.bold())
                .foregroundColor(.theme)
        }

    }
}

struct LoginOptionTag: View {
    var imageName: String
    var title: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .font(.callout)

            Text(title)
                .font(.callout)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 50)
        .background(.tertiaryBG)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.lightGray, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    NavigationStack {
        LoginScreen()
    }
}
