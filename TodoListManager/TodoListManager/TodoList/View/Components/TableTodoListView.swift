//
//  TableTodoListView.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import UIKit

class TableTodoListView: ComponentBaseView, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Cycle life
    override func awakeFromNib() {
        super.awakeFromNib()
//        registerNib()
    }
    
    override func initializeSubviews() {
//        let viewName = StyleMSMaintenanceTableView.viewName
//        viewLocal = Bundle.main.loadNibNamed(viewName, owner: self, options: nil)![0] as? UIView
//        viewLocal?.frame = self.bounds
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
