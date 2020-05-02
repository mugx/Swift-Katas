//
//  FibonacciKataTests.swift
//  FibonacciKataTests
//
//  Created by mugx on 01/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import XCTest
@testable import FibonacciKata

class FibonacciKataTests: XCTestCase {
    func fib(_ n: Int) -> Int {
        var result = 0
        var oldResult = 0

        for i in 0 ... n {
            if i == 0 {
                result = 0
            } else if i == 1 {
                result = 1
            } else {
                let currentResult = result
                result = result + oldResult
                oldResult = currentResult
            }
        }
        
        return result
    }

    func test0() throws {
        XCTAssertEqual(fib(0), 0)
    }

    func test1() throws {
        XCTAssertEqual(fib(1), 1)
    }

    func test2() throws {
        XCTAssertEqual(fib(2), 1)
    }

    func test3() throws {
        XCTAssertEqual(fib(3), 2)
    }

    func test4() throws {
        XCTAssertEqual(fib(4), 3)
    }

    func test5() throws {
        XCTAssertEqual(fib(5), 5)
    }
}
