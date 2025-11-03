//
//  LoginRequest.swift
//  Gofer
//
//  Created by Abhishek Velekar on 03/11/25.
//

struct LoginRequestDto : Codable {
    let userName: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "id"
        case password
    }
}
