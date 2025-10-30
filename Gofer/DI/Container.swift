//
//  Container.swift
//  Gofer
//
//  Created by Abhishek Velekar on 30/10/25.
//
import FactoryKit

extension Container{
    
    var testModel : Factory<Test>{
        Factory(self){ Test(id : 10) }
            .singleton
    }
}
