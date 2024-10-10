//
//  EmptyState.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/9/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -30)
        }
    }
}

#Preview {
    EmptyState(imageName: "emptyState", message: "This is our test message.\n I'm making it a little longer to see if it wraps.")
}
