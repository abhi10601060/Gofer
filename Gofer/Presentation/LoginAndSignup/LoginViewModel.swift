//
//  LoginViewModel.swift
//  Gofer
//
//  Created by Abhishek Velekar on 01/11/25.
//

import Foundation
internal import Combine


class LoginViewModel : ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var errorDescription: String = ""
    
    
    func isFormValid() -> Bool {
        let isValid = !email.isEmpty && !password.isEmpty
        if !isValid {
            showErrorAlert = true
            errorDescription = "Please fill all the fields"
        }
        return isValid
    }
    
    func signIn(){
        if isFormValid() {
            isLoading = true
        }
    }
}
