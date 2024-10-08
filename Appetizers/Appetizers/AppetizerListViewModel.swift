//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/8/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
