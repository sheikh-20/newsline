//
//  OnboardViewModel.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import Foundation
import Combine

class OnboardViewModel: ObservableObject {
    
    func loginWithPassword(email: String, password: String) {
        NSLog("Login: \(email) \(password)")
    }
    
    func signupWithPassword(email: String, password: String) {
        NSLog("Login: \(email) \(password)")
    }
}
