//
//  AccountView.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/8/24.
//

import SwiftUI

struct AccountView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var birthday = Date()
    @State private var extraNapkins = false
    @State private var requentRefills = false
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Fierst Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    
                    Button {
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requeats")) {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                        //.tint(.brandPrimary)
                    Toggle("Freqent Refills", isOn: $requentRefills)
                        //.tint(.brandPrimary)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("🤗 Account")
        }
    }
}

#Preview {
    AccountView()
}
