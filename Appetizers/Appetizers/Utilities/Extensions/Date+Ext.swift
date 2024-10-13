//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Mikhail Tabakaev on 10/11/24.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
}

