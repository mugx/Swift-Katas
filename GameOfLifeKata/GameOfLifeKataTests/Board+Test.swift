//
//  Array+Utils.swift
//  GameOfLifeKataTests
//
//  Created by mugx on 02/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import Foundation
@testable import GameOfLifeKata

extension Board {
    func debug() {
        print("")
        for i in 0 ..< cells.count {
            for j in 0 ..< cells[i].count {
                print(cells[i][j].rawValue, terminator:"")
            }
            print("")
        }
    }
}
