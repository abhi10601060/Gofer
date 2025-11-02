//
//  PingUseCase.swift
//  Gofer
//
//  Created by Abhishek Velekar on 02/11/25.
//

struct PingUseCase{
    
    func execute() async{
        await AuthRepoImpl().ping()
    }
}
