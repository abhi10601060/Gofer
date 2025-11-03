//
//  SignupRequestDto.swift
//  Gofer
//
//  Created by Abhishek Velekar on 03/11/25.
//

struct SignupRequestDto : Codable{
    let username: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case username = "id"
        case password
    }
}
