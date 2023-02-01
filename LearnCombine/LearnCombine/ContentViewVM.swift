//
//  ContentViewVM.swift
//  LearnCombine
//
//  Created by Tom Manuel on 30/01/23.
//

import Foundation
import SwiftUI

enum SignInValidation: LocalizedError {
    case emptyDetails
    case invalidEmail, invalidPassword
    
    var errorDescription: String? {
        switch self {
        case .emptyDetails:
            return "Please enter all the details"
        case .invalidEmail:
            return "Please enter a valid email"
        case .invalidPassword:
            return "Please enter a valid password"
        }
    }
}

class ContentViewVM: ObservableObject {
    @Published var userName: String = "ab"
    @Published var password: String = ""
    var signInMessage: String? = ""
    @Published var isAlertPresented: Bool = false
    
    func signInButtonAction() {
        do {
            try validate()
            signInMessage = "You have signed in successfully!"
            isAlertPresented = true
        } catch {
            signInMessage = error.localizedDescription
            isAlertPresented = true
        }
    }
    
    private func validate() throws {
        if userName.isEmpty || password.isEmpty {
            throw SignInValidation.emptyDetails
        }
        if !userName.contains(where: { $0 == "@" }) {
            throw SignInValidation.invalidEmail
        }
        if password.count < 8 {
            throw SignInValidation.invalidPassword
        }
    }
}
