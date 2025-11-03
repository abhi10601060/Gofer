//
//  SignupViewModel.swift
//  Gofer
//
//  Created by Abhishek Velekar on 01/11/25.
//

import Foundation
internal import Combine


class SignupViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isPolicyAccepted: Bool = false
    @Published var isLoading: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var errorDescription: String = ""
    
    private let signupUseCase : SignupUseCase = SignupUseCase()
    let tokenSubject: PassthroughSubject<String, Never> = .init()
   
    func isValidForm() -> Bool {
        let isValid = !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
        return isValid
    }
    
    func isPasswordMatch() -> Bool {
        return password == confirmPassword
    }
    
    func signUp() async{
        if !isValidForm(){
            showErrorAlert = true
            errorDescription = "Please fill all the fields"
            return
        }
        
        if !isPasswordMatch(){
            showErrorAlert = true
            errorDescription = "Password and confirm password does not match"
            return
        }
        
        isLoading = true
        do{
            let body = SignupRequestDto(username: email, password: password)
            let res = try await signupUseCase.execute(body: body)
            tokenSubject.send(res.token)
        } catch {
            showErrorAlert = true
            errorDescription = "\(error)"
        }
        isLoading = false
    }
}
