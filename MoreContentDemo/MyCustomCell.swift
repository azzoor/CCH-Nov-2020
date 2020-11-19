//
//  MyCustomCell.swift
//  MoreContentDemo
//
//  Created by Aaron Stephenson on 18/11/20.
//

import UIKit
import Accessibility

class MyCustomCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellBSB: UILabel!
    @IBOutlet weak var cellAccNumber: UILabel!
    @IBOutlet weak var cellBalance: UILabel!
}

extension MyCustomCell: AXCustomContentProvider {
    var accessibilityCustomContent: [AXCustomContent]! {
        get {
            let balanceContent = AXCustomContent(label: "Balance", value: "$12,345")
            let bsbContent = AXCustomContent(label: "BSB", value: "999-999")
            let accNumberContent = AXCustomContent(label: "Account number", value: "123456789")
                        
            balanceContent.importance = .high
            
            return [balanceContent, bsbContent, accNumberContent]
        }
        set(accessibilityCustomContent) {}
    }
}
