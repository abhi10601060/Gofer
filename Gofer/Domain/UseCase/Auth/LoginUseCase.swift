//
//  LoginUseCase.swift
//  Gofer
//
//  Created by Abhishek Velekar on 03/11/25.
//
import FactoryKit

struct LoginUseCase {
    @Injected(\.authRepo) var autoRepo: AuthRepo
    
    func execute(body: LoginRequestDto) async throws -> LoginResponseDto {
        return try await self.autoRepo.login(body: body)
    }
}
