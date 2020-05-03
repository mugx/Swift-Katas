//
//  MinesweeperKataTests.swift
//  MinesweeperKataTests
//
//  Created by mugx on 02/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import XCTest
@testable import MinesweeperKata

class MinesweeperKataTests: XCTestCase {
    func mineSweeper(rows: Int, columns: Int, mines: String) -> String? {
        guard rows > 0, rows <= 100, columns > 0, columns <= 100 else {
            return nil
        }

        let n = rows * columns
        var result = Array(mines)
        for i in 0 ..< n {
            if result[i] == "*" {
                continue
            }

            if result[i] == "." {
                result[i] = "0"
            }

            let row = i / columns
            let column = (i % columns)

            //w
            if column - 1 >= 0 && result[(row * columns) + column - 1] == "*" {
                let count = String((Int(String(result[i])) ?? 0) + 1)
                result[i] = String.Element(count)
            }

            //e
            if column + 1 < columns && result[(row * columns) + column + 1] == "*" {
                let count = String((Int(String(result[i])) ?? 0) + 1)
                result[i] = String.Element(count)
            }

            //n
            if row - 1 >= 0 && result[((row - 1) * columns) + column] == "*" {
                let count = String((Int(String(result[i])) ?? 0) + 1)
                result[i] = String.Element(count)
            }

            //nw
            if column - 1 >= 0 && row - 1 >= 0 &&
                result[((row - 1) * columns) + column - 1] == "*" {
                let count = String((Int(String(result[i])) ?? 0) + 1)
                result[i] = String.Element(count)
            }

            //ne
            if column + 1 < columns && row - 1 >= 0 &&
                result[((row - 1) * columns) + column + 1] == "*" {
                let count = String((Int(String(result[i])) ?? 0) + 1)
                result[i] = String.Element(count)
            }

            //s
            if row + 1 < rows && result[((row + 1) * columns) + column] == "*" {
                let count = String((Int(String(result[i])) ?? 0) + 1)
                result[i] = String.Element(count)
            }

            //sw
            if column - 1 >= 0 && row + 1 < rows &&
                result[((row + 1) * columns) + column - 1] == "*" {
                let count = String((Int(String(result[i])) ?? 0) + 1)
                result[i] = String.Element(count)
            }

            //se
            if column + 1 < columns && row + 1 < rows &&
                result[((row + 1) * columns) + column + 1] == "*" {
                let count = String((Int(String(result[i])) ?? 0) + 1)
                result[i] = String.Element(count)
            }
        }
        return String(result)
    }

    func testNil() throws {
        let result = mineSweeper(rows: 0, columns: 0, mines: "")
        XCTAssertNil(result)
    }

    func test101() throws {
        let result = mineSweeper(rows: 101, columns: 101, mines: "")
        XCTAssertNil(result)
    }

    func testAllDots() throws {
        let input = "................"
        let expectedResult = "0000000000000000"
        let result = mineSweeper(rows: 4, columns: 4, mines: input)
        XCTAssertEqual(result, expectedResult)
    }

    func testAllMines() throws {
        let input = "****************"
        let expectedResult = "****************"
        let result = mineSweeper(rows: 4, columns: 4, mines: input)
        XCTAssertEqual(result, expectedResult)
    }

    func testInput() throws {
        let input = "*........*......"
        let expectedResult = "*10022101*101110"
        let result = mineSweeper(rows: 4, columns: 4, mines: input)
        XCTAssertEqual(result, expectedResult)
    }

    func testWestMine() throws {
        let input = "*."
        let expectedResult = "*1"
        let result = mineSweeper(rows: 1, columns: 2, mines: input)
        XCTAssertEqual(result, expectedResult)
    }

    func testEastMine() throws {
        let input = ".*"
        let expectedResult = "1*"
        let result = mineSweeper(rows: 1, columns: 2, mines: input)
        XCTAssertEqual(result, expectedResult)
    }

    func testNorthMine() throws {
        let input = "**.*"
        let expectedResult = "**3*"
        let result = mineSweeper(rows: 2, columns: 2, mines: input)
        XCTAssertEqual(result, expectedResult)
    }

    func testSouthMine() throws {
        let input = ".***"
        let expectedResult = "3***"
        let result = mineSweeper(rows: 2, columns: 2, mines: input)
        XCTAssertEqual(result, expectedResult)
    }
}
