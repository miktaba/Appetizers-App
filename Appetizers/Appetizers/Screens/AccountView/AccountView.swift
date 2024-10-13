//
//  AccountView.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/8/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Fierst Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                    
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    //DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    
                    DatePicker(
                        "Birthday",
                        selection: $viewModel.user.birthday,
                        in: Date().oneHundredYearsAgo...Date().eighteenYearsAgo,
                        displayedComponents: .date
                    )
                    
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
            .onTapGesture {
                focusedTextField = nil
            }
            
//            .toolbar {
//                ToolbarItem(placement: .keyboard) {
//                    Button("Dismiss Keyboard") { focusedTextField = nil }
//                }
//            }
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
