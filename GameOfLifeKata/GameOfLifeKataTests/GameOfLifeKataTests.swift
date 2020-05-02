//
//  GameOfLifeKataTests.swift
//  GameOfLifeKataTests
//
//  Created by mugx on 02/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import XCTest
@testable import GameOfLifeKata

class GameOfLifeKataTests: XCTestCase {
    func testDead() throws {
        let board = Board([
            [Board.State.dead]
        ])
        let expectedBoard = Board([
            [Board.State.dead]
        ])
        board.evolve()
        XCTAssertEqual(board, expectedBoard)
    }

    func testUnderpopulation() {
        let board = Board([
            [Board.State.alive]
        ])
        let expectedBoard = Board([
            [Board.State.dead]
        ])
        board.evolve()
        XCTAssertEqual(board, expectedBoard)
    }

    func test1AliveNeighbour() {
        let board = Board([
            [.dead,.dead,.alive],
            [.dead,.alive,.dead],
            [.dead,.dead,.dead]
        ])
        let expectedBoard = Board([
            [.dead,.dead,.dead],
            [.dead,.dead,.dead],
            [.dead,.dead,.dead]
        ])
        board.evolve()
        XCTAssertEqual(board, expectedBoard)
    }

    func test2AliveNeighbours() {
        let board = Board([
            [.dead,.alive,.alive],
            [.dead,.alive,.alive],
            [.dead,.dead,.dead]
        ])
        let expectedBoard = Board([
            [.dead,.alive,.alive],
            [.dead,.alive,.alive],
            [.dead,.dead,.dead]
        ])
        board.evolve()
        XCTAssertEqual(board, expectedBoard)
    }

    func test3AliveNeighbours() {
        let board = Board([
            [.alive,.dead,.dead],
            [.alive,.dead,.dead],
            [.alive,.dead,.dead]
        ])
        let expectedBoard = Board([
            [.dead,.dead,.dead],
            [.alive,.alive,.dead],
            [.dead,.dead,.dead]
        ])
        board.evolve()
        XCTAssertEqual(board, expectedBoard)
    }
}
