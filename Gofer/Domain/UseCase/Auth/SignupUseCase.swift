//
//  SignupUseCase.swift
//  Gofer
//
//  Created by Abhishek Velekar on 03/11/25.
//

import FactoryKit

struct SignupUseCase {
    @Injected(\.authRepo) var authRepo: AuthRepo
    
    func execute(body: SignupRequestDto) async throws -> SignupResponseDto {
        try await authRepo.signup(body: body)
    }
}
