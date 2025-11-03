//
//  AuthServiceImpl.swift
//  Gofer
//
//  Created by Abhishek Velekar on 02/11/25.
//

import Foundation

class AuthServiceImpl: AuthService {
    
    func login(body: LoginRequestDto) async throws -> LoginResponseDto {
        return try await RestClient.post(url: AuthServiceUrl + "/login", body: body)
    }
    
    func signup(body: SignupRequestDto) async throws -> SignupResponseDto {
        return try await RestClient.post(url: AuthServiceUrl + "/signup", body: body)
    }
    
    func ping() async {
        do {
            let data : PingDto = try await RestClient.get( url: AuthServiceUrl + "/ping")
            print(String(decoding: try JSONEncoder().encode(data), as: UTF8.self))
        } catch {
            print("AuthServiceImpl Error: \(error)")
        }
    }
    
}
