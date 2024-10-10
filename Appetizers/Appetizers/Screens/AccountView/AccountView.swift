//
//  AccountView.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/8/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Fierst Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requeats")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        //.tint(.brandPrimary)
                    Toggle("Freqent Refills", isOn: $viewModel.user.requentRefills)
                        //.tint(.brandPrimary)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("🤗 Account")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}

#Preview {
    AccountView()
}
