//
//  ViewController.swift
//  TableView
//
//  Created by Maksim Vialykh on 31/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    // Create constant data source
    private let dataSource = TableDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Attach to table view
        dataSource.attach(to: table)
        // Setup data set
        dataSource.items = ["The", "Best", "Solution", "for", "Data Source", "is", "Separated", "Class"]
    }
    
}

/*
 The Data Source Pattern is provide element to view depends on data that it's owns
 */

// TODO: - Move to separated file TableDataSource.swift
class TableDataSource: NSObject {
    
    var items: [String] = []
    
    func attach(to view: UITableView) {
        // Setup itself as table data source (Implementation in separated extension)
        view.dataSource = self
        // Register element for dequeuing (All dequeuing element must register in table before)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
    }
    
}

// MARK: - UITableViewDataSource
extension TableDataSource: UITableViewDataSource {
    
    // Return elements count that must be displayed in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Instantiate or reused (depend on position and cell type in table view), configure cell element and return it for displaying on table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(UITableViewCell.self)"
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        cell.textLabel?.text = item
        return cell
    }
    
}
