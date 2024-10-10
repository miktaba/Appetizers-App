//
//  User.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/9/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var requentRefills = false
}
