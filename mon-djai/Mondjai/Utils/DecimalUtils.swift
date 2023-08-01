//
//  DecimalUtils.swift
//  mon-djai
//
//  Created by user.local on 9/8/2023.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
