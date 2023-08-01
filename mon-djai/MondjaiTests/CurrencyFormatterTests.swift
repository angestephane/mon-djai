//
//  CurrencyFormatterTests.swift
//  MondjaiTests
//
//  Created by user.local on 10/8/2023.
//

import Foundation

import XCTest

@testable import Mondjai

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakCfaIntoCents() throws {
        let result = formatter.breakIntoSommeAndCents(245850.24)
        XCTAssertEqual(result.0, "245\u{202F}850")
        XCTAssertEqual(result.1, "24")
    }
    
    func testCfaFormatted() throws {
        let result = formatter.cfaFormatted(245850.24)
        XCTAssertEqual(result, "245\u{202F}850\u{00A0}F\u{202F}CFA")
    }
    
    func testZeroCfaFormatter() throws {
        let result = formatter.cfaFormatted(0.00)
        XCTAssertEqual(result, "0\u{00A0}F\u{202F}CFA")
    }
}
