//
//  GameOfLife.swift
//  GameOfLifeKata
//
//  Created by mugx on 02/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import Foundation

class Board: Equatable {
    enum State: String {
        case alive = "*"
        case dead = "."

        static func random() -> State {
            return Int.random(in: 0...1) == 0 ? .alive : .dead
        }
    }

    private(set) var cells: [[State]] = []
    var rows: Int { cells.count }
    var columns: Int { cells.first!.count }
    var generation = 0

    static func == (lhs: Board, rhs: Board) -> Bool {
        return lhs.cells == rhs.cells
    }

    init(rows: Int, columns: Int) {
        cells = [[Board.State]](repeating: [Board.State](repeating: .dead, count: columns), count: rows)
        randomize()
    }

    init(_ cells: [[State]]) {
        self.cells = cells
    }

    func randomize() {
        for i in 0 ..< rows {
            for j in 0 ..< columns {
                cells[i][j] = Board.State.random()
            }
        }
    }

    func evolve() {
        generation += 1

        var result = cells
        for row in 0 ..< rows {
            for col in 0 ..< columns {
                var neighbours = 0

                neighbours = row - 1 >= 0 && col - 1 >= 0 && cells[row - 1][col - 1] == .alive
                    ? neighbours + 1 : neighbours
                neighbours = row - 1 >= 0 && cells[row - 1][col] == .alive
                    ? neighbours + 1 : neighbours
                neighbours = row - 1 >= 0 && col + 1 < columns && cells[row - 1][col + 1] == .alive
                    ? neighbours + 1 : neighbours
                neighbours = col - 1 >= 0 && cells[row][col - 1] == .alive
                    ? neighbours + 1 : neighbours
                neighbours = col + 1 < columns && cells[row][col + 1] == .alive
                    ? neighbours + 1 : neighbours
                neighbours = row + 1 < rows && col - 1 >= 0 && cells[row + 1][col - 1] == .alive
                    ? neighbours + 1 : neighbours
                neighbours = row + 1 < rows && cells[row + 1][col] == .alive
                    ? neighbours + 1 : neighbours
                neighbours = row + 1 < rows && col + 1 < columns && cells[row + 1][col + 1] == .alive
                    ? neighbours + 1 : neighbours

                if result[row][col] == .alive && neighbours < 2 || neighbours > 3 {
                    result[row][col] = .dead
                } else if result[row][col] == .dead && neighbours == 3 {
                    result[row][col] = .alive
                }
            }
        }

        self.cells = result
    }
}
