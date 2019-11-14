//
//  DetailViewController.swift
//  DatePicker
//
//  Created by Tiffany Obi on 11/14/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK:- outlets and properties
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var selectDateLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    
    
    
    // we need objects (event) from the YellowCreateEventViewController
    var event: Event?
    // lazy variable is a variable that gets created the first time its needed
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK:- method to update the UI elements
    
    func updateUI(){
        guard let date = event?.date else {
            return}
        
        selectDateLabel.text = dateFormatter.string(from: date)
        messageLabel.text = event?.name
        if  switchControl.isOn {
            event?.willAttend = true
        } else {event?.willAttend = false
    }
    
}

}
