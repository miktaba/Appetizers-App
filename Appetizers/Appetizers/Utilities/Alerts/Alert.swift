//
//  Alert.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/8/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

// MARK: - Network Alerts
struct AlertContext {
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid. Please contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again or contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue connecting to the server. If this issue persists, please try again or contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unnable to complete the request at this time. Please check your internet connection and try again."),
        dismissButton: .default(Text("OK")))
    
    
    // MARK: - Account Alerts
    static let invalidForm = AlertItem(
        title: Text("Invalid Form"),
        message: Text("Please ensure all fields in the form have been filled out."),
        dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please ensure the email address is correct."),
        dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(
        title: Text("Profile Saved"),
        message: Text("Your profile information was successfully saved."),
        dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(
        title: Text("Profile Error"),
        message: Text("There was an error saving or retrieving your profile."),
        dismissButton: .default(Text("OK")))
}
