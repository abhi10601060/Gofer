//
//  AuthRepoImpl.swift
//  Gofer
//
//  Created by Abhishek Velekar on 02/11/25.
//

import FactoryKit

class AuthRepoImpl: AuthRepo {
    
    @Injected(\.authService) var authService: AuthService

    func ping() async {
        await self.authService.ping()
    }

}
