//
//  AuthService.swift
//  Gofer
//
//  Created by Abhishek Velekar on 02/11/25.
//

protocol AuthService{
    
    func ping() async
    
    func login(body: LoginRequestDto) async throws -> LoginResponseDto
    
    func signup(body: SignupRequestDto) async throws -> SignupResponseDto
}
