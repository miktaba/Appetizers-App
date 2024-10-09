//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/9/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkins = false
    @Published var requentRefills = false
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("Changes have been saved successfully")
    }
}
