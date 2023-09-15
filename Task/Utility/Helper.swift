//
//  Helper.swift
//  Task
//
//  Created by Muhammad Junaid on 15/09/2023.
//

import Foundation

class Helper {
    static var shared = Helper()
    
    func convertDateStrIntoDate(dateStr: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateStr)
    }
    
    func convertDateIntoDateString(date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
}
