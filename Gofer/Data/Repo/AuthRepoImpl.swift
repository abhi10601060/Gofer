//
//  AuthRepoImpl.swift
//  Gofer
//
//  Created by Abhishek Velekar on 02/11/25.
//

import FactoryKit

struct AuthRepoImpl: AuthRepo {
    
    @Injected(\.authService) var authService: AuthService

    func ping() async {
        await self.authService.ping()
    }
    
    func login(body: LoginRequestDto) async throws -> LoginResponseDto {
       return try await authService.login(body: body)
    }
    
    func signup(body: SignupRequestDto) async throws -> SignupResponseDto {
        return try await authService.signup(body: body)
    }
}
