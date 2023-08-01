//
//  CurencyFormatter.swift
//  mon-djai
//
//  Created by user.local on 9/8/2023.
//

import Foundation

import UIKit

struct CurrencyFormatter {
    
    func makeAttributedCurrency(_ amount: Decimal) -> NSMutableAttributedString {
        let tuple = breakIntoSommeAndCents(amount)
        return makeBalanceAttributed(somme: tuple.0, cents: tuple.1)
    }
    
    // Converts 929466.23 > "929466" "23"
    func breakIntoSommeAndCents(_ amount: Decimal) -> (String, String) {
        let tuple = modf(amount.doubleValue)
        
        let somme = convertCfa(tuple.0)
        let cents = convertCents(tuple.1)
        
        return (somme, cents)
    }
    
    // Converts 929466 > 929 466
    private func convertCfa(_ cfaPart: Double) -> String {
        let sommeWithDecimal = cfaFormatted(cfaPart) // "929 466 F CFA.00"
        let formatter = NumberFormatter()
        let decimalSeparator = formatter.decimalSeparator! // "."
        let sommeComponents = sommeWithDecimal.components(separatedBy: decimalSeparator) // ["929,466 F CFA", "00"]
        var somme = sommeComponents.first! // ["929,466", "F CFA", ]
        somme.removeAll(where: {$0.isLetter}) // "929,466 "
        let cfa = somme.trimmingCharacters(in: .whitespaces)// "929,466"
        return cfa
    }
    
    // Convert 0.23 > 23
    private func convertCents(_ centPart: Double) -> String {
        let cents: String
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%.0f", centPart * 100)
        }
        return cents
    }
    
    // Converts 929466 > 929 466.00 F FCA
    func cfaFormatted(_ cfa: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "fr_CIV")
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: cfa as NSNumber) {
            return result
        }
        
        return ""
    }
    
    private func makeBalanceAttributed(somme: String, cents: String) -> NSMutableAttributedString {
        let cfaSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title3)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title3)]
        
        let cfString = NSAttributedString(string: "FCFA", attributes: cfaSignAttributes)
        let rootString = NSMutableAttributedString(string: somme, attributes: dollarAttributes)
        let centString = NSAttributedString(string: ".\(cents)", attributes: centAttributes)
        
        rootString.append(centString)
        rootString.append(cfString)
        
        
        return rootString
    }
}
