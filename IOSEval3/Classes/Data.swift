//
//  Data.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import Foundation

func formattedPrice(priceUsd :String) -> String? {
    if let double = Double(priceUsd) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: double as NSNumber)
    }
    return "- $"
}

func formattedDate(date :String) -> String {
    let dateFormatterInput = DateFormatter()
    dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
    let dateDate = dateFormatterInput.date(from: date)
    let dateFormatterOutput = DateFormatter()
    dateFormatterOutput.dateStyle = .short
    return dateFormatterOutput.string(from: dateDate ?? Date())
}
