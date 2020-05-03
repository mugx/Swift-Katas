//
//  LeapYearKataTests.swift
//  LeapYearKataTests
//
//  Created by mugx on 03/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import XCTest
@testable import LeapYearKata

class LeapYearKataTests: XCTestCase {
    func leapYear(_ year: Int) -> Bool {
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) 
    }

    func testCommonYear() throws {
        XCTAssertFalse(leapYear(2001))
    }

    func testAtypicalCommonYear() throws {
        XCTAssertFalse(leapYear(1900))
    }

    func testLeapYear() throws {
        XCTAssertTrue(leapYear(1996))
    }

    func testAtypicalLeapYear() throws {
        XCTAssertTrue(leapYear(2000))
    }
}
