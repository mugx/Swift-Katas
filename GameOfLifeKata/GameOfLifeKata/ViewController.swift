//
//  ViewController.swift
//  GameOfLifeKata
//
//  Created by mugx on 02/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import UIKit

class CellView: UIView {
    init(i: Int, j: Int, isAlive: Bool) {
        super.init(frame: .zero)
        
        if isAlive {
            backgroundColor = .blue
        } else {
            backgroundColor = .white
        }
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    @IBOutlet var generationLabel: UILabel!
    @IBOutlet var sizeButton: UIButton!
    var board: Board?
    var rows = 8
    var columns = 8 
    var speed: Double = 0.2
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        resetBoard()
    }

    // MARK: - Actions
    
    @IBAction func playAction() {
        play()
    }
    
    @IBAction func pauseAction() {
        stop()
    }
    
    @IBAction func restartAction() {
        resetBoard()
    }
    
    @IBAction func sizeAction() {
        let alert = UIAlertController(title: "Change size", message: "insert the new size", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = "\(self.rows)"
            textField.placeholder = "Rows"
            textField.textContentType = .creditCardNumber
        }
        alert.addTextField { (textField) in
            textField.text = "\(self.columns)"
            textField.placeholder = "Columns"
            textField.textContentType = .creditCardNumber
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            guard let rows = Int(alert.textFields?[0].text ?? ""), rows > 0,
                let columns = Int(alert.textFields?[1].text ?? ""), columns > 0 else {
                    return
            }
            
            self.rows = rows
            self.columns = columns
            self.resetBoard()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Private functions
    
    private func refresh() {
        guard let board = board else {
            return
        }

        generationLabel.text = "Generation: \(board.generation)"
        sizeButton.setTitle("\(rows)x\(columns)", for: .normal)

        view.subviews.forEach {
            if $0 is CellView {
                $0.removeFromSuperview()
            }
        }

        let spacing: CGFloat = 40
        let size = Int((view.bounds.width - spacing) / CGFloat(rows))
        let offsetX = Int(view.bounds.width / 2.0) - (rows * size) / 2
        let offsetY = Int(view.bounds.height / 2.0) - (columns * size) / 2

        for i in 0 ..< rows {
            for j in 0 ..< columns {
                let isAlive = board.cells[i][j] == .alive
                let cell = CellView(i: i, j: j, isAlive: isAlive)
                cell.frame = CGRect(x: i * size + offsetX,
                                    y: j * size + offsetY,
                                    width: size,
                                    height: size)
                view.addSubview(cell)
            }
        }
    }

    private func play() {
        stop()
        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true, block: { (timer) in
            self.board?.evolve()
            self.refresh()
        })
    }
    
    private func stop() {
        timer?.invalidate()
        timer = nil
    }

    private func resetBoard() {
        board = Board(rows: rows, columns: columns)
        play()
    }
}

