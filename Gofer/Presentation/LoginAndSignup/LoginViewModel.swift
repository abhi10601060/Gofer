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
    private var loginUseCase = LoginUseCase()
    
    let tokenSubject = PassthroughSubject<String, Never>()
    
    
    func isFormValid() -> Bool {
        let isValid = !email.isEmpty && !password.isEmpty
        if !isValid {
            showErrorAlert = true
            errorDescription = "Please fill all the fields"
        }
        return isValid
    }
    
    func signIn() async {
        if isFormValid() {
            isLoading = true
            do{
                let body = LoginRequestDto(userName: email, password: password)
                let res = try await loginUseCase.execute(body: body)
                tokenSubject.send(res.token)
            } catch {
                showErrorAlert = true
                errorDescription = "\(error)"
            }
            isLoading = false
        }
        
    }
}
