//
//  TableTodoListViewCell.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 17/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import UIKit

enum StateTodo: String {
    case notDone = "Not done"
    case done = "Done"
}

// MARK: Configuration Structs
struct StyleTableTodoListViewCell {
    static let viewName = "TableTodoListViewCell"
    static let cellIdentifier = "Cell"
    static let heightForRow: CGFloat = 50
}

struct DataTableTodoListViewCell {
    var name: String
    var state: StateTodo
}

struct ClosureTableTodoListViewCell {
    var changeStateTodoElement: (() -> ())
}

class TableTodoListViewCell: UITableViewCell {
    // MARK: IBOutlets
    
    @IBOutlet weak var btnFinishElement: UIButton!
    @IBOutlet weak var nameElement: UILabel!
    
    var closure: ClosureTableTodoListViewCell?
    
    var stateTodoElement: StateTodo = .notDone
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nibForCell() -> UINib {
        let nibName = String(describing: self)
        let nib : UINib = UINib(nibName: nibName, bundle: nil)
        
        return nib
    }
    
    @IBAction func actionBtnFinishElement(_ sender: Any) {
        switch stateTodoElement {
        case .done:
            self.btnFinishElement.setTitle(StateTodo.notDone.rawValue,for: .normal)
            break
        case .notDone:
            self.btnFinishElement.setTitle(StateTodo.done.rawValue,for: .normal)
            break
        }
        if let closure = closure {
            closure.changeStateTodoElement()
        }
    }

    //MARK: Public API
    func configureCell(_ data: DataTableTodoListViewCell, closures: ClosureTableTodoListViewCell ) {
        nameElement.text = data.name
        stateTodoElement = data.state
        btnFinishElement.setTitle(stateTodoElement.rawValue,for: .normal)
        closure = closures
    }
}
