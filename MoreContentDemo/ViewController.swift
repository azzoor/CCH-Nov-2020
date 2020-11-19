//
//  ViewController.swift
//  MoreContentDemo
//
//  Created by Aaron Stephenson on 18/11/20.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: "MyCustomCell", bundle: nil), forCellReuseIdentifier: "MyCustomCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell") as! MyCustomCell
        cell.cellTitle!.text = "Bank account \(indexPath.row)"
        cell.cellBSB.text = "BSB: 999-999"
        cell.cellAccNumber.text = "Acc No. 123456789"
        cell.cellBalance.text = "$12,345"

        cell.accessibilityLabel = "Bank account \(indexPath.row)"

        let transferIcon = UIImage(systemName: "dollarsign.square")
        let actionTransfer = UIAccessibilityCustomAction(name: "Transfer", image: transferIcon) { (action) -> Bool in
            //Perform action
            return true
        }

        let shareIcon = UIImage(systemName: "square.and.arrow.up")
        let actionShareDetails = UIAccessibilityCustomAction(name: "Share", image: shareIcon) { (action) -> Bool in
            //Perform action
            return true
        }
        
        cell.accessibilityCustomActions = [actionTransfer, actionShareDetails]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

