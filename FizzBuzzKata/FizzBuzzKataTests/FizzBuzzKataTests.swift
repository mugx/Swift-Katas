//
//  FizzBuzzKataTests.swift
//  FizzBuzzKataTests
//
//  Created by mugx on 01/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import XCTest
@testable import FizzBuzzKata

class FizzBuzzKataTests: XCTestCase {
    func fizzBuzz(_ n: Int) -> String {
        var result = ""

        for i in 0 ... n {
            if i == 0 {
                result = ""
            } else if i % 15 == 0 {
                result.append("FizzBuzz")
            } else if i % 3 == 0 {
                result.append("Fizz")
            } else if i % 5 == 0 {
                result.append("Buzz")
            } else {
                result.append("\(i)")
            }
        }

        return result
    }

    func test0() throws {
        XCTAssertEqual(fizzBuzz(0), "")
    }

    func test1() throws {
        XCTAssertEqual(fizzBuzz(1), "1")
    }

    func test2() throws {
        XCTAssertEqual(fizzBuzz(2), "12")
    }

    func test3() throws {
        XCTAssertEqual(fizzBuzz(3), "12Fizz")
    }

    func test4() throws {
        XCTAssertEqual(fizzBuzz(4), "12Fizz4")
    }

    func test5() throws {
        XCTAssertEqual(fizzBuzz(5), "12Fizz4Buzz")
    }

    func test15() throws {
        XCTAssertEqual(fizzBuzz(15), "12Fizz4BuzzFizz78FizzBuzz11Fizz1314FizzBuzz")
    }
}
