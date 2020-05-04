//
//  PrimeFactorsKataTests.swift
//  PrimeFactorsKataTests
//
//  Created by mugx on 04/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import XCTest
@testable import PrimeFactorsKata

extension Int {
    func isPrime() -> Bool {
        guard self > 1 else {
            return false
        }

        for i in 2 ..< self {
            if self % i == 0 {
                return false
            }
        }

        return true
    }
}

class PrimeFactorsKataTests: XCTestCase {
    func primeFactors(_ n: Int) -> [Int] {
        guard n > 0, n > 1 else {
            return []
        }

        var result: [Int] = []

        var n = n
        for divisor in 2 ... n {
            while n % divisor == 0 {
                result.append(divisor)
                n /= divisor
            }
        }

        return result
    }

    func test0() throws {
        let result = primeFactors(0)
        XCTAssertEqual(result, [])
    }

    func test1() throws {
        let result = primeFactors(1)
        XCTAssertEqual(result, [])
    }

    func test2() throws {
        let result = primeFactors(2)
        XCTAssertEqual(result, [2])
    }

    func test3() throws {
        let result = primeFactors(3)
        XCTAssertEqual(result, [3])
    }

    func test4() throws {
        let result = primeFactors(4)
        XCTAssertEqual(result, [2, 2])
    }

    func test6() throws {
        let result = primeFactors(6)
        XCTAssertEqual(result, [2, 3])
    }

    func test60() throws {
        let result = primeFactors(60)
        XCTAssertEqual(result, [2, 2, 3, 5])
    }
}
