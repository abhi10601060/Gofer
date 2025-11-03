//
//  Container.swift
//  Gofer
//
//  Created by Abhishek Velekar on 30/10/25.
//
import FactoryKit
import Foundation

extension Container {

    var testModel: Factory<Test> {
        Factory(self) { Test(id: 10) }
            .singleton
    }

    var jsonDecoder: Factory<JSONDecoder> {
        Factory(self) { JSONDecoder() }
            .singleton
    }

    var jsonEncoder: Factory<JSONEncoder> {
        Factory(self) { JSONEncoder() }
            .singleton
    }

    var authService: Factory<AuthService> {
        Factory(self) { AuthServiceImpl() }
            .singleton
    }
    
    var authRepo: Factory<AuthRepo> {
        Factory(self) { AuthRepoImpl() }
            .singleton
    }
}

