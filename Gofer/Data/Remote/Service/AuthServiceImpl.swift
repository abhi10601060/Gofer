//
//  AuthServiceImpl.swift
//  Gofer
//
//  Created by Abhishek Velekar on 02/11/25.
//

import Foundation

class AuthServiceImpl: AuthService {
    
    func ping() async {
        do {
            let data : PingDto = try await RestClient.get( url: "http://13.127.189.11:8000/ping")
            print(String(decoding: try JSONEncoder().encode(data), as: UTF8.self))
        } catch {
            print("AuthServiceImpl Error: \(error)")
        }
    }
}
