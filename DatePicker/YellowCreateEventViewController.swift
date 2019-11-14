//
//  ViewController.swift
//  DatePicker
//
//  Created by Tiffany Obi on 11/14/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class YellowCreateEventViewController: UIViewController {
    //MARK:- outlets and properties
    
    @IBOutlet weak var evenTextfield: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var createEventButton: UIButton!
    
    @IBOutlet weak var rsvpLabel: UILabel!
    
    var event: Event! {
        didSet {
            // update UI whenever event changes. didSet is a property observer that gets called when property changes.
            if event.willAttend {
                rsvpLabel.text = "RSVP YES"
                createEventButton.setTitle("View Event",for: .normal)
            } else {
                rsvpLabel.text = "RSVP NO"
                createEventButton.setTitle("RSVP to Event", for: .normal)
            }
        }
    }
    
    // MARK:- view controller life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // we need to set the view controller as the delegate object for the eventtextfield.
        event = Event(name: "Event name not set", willAttend: false, date: Date()) // date() gives current date/time.
        evenTextfield.delegate = self
        
        //configure date picker in code.
        datePicker.minimumDate = Date() // user is not allowed to put a past date.
        // datePicker.maximumDate = Date.distantFuture
    }
    
    // anytime we transistion from view a to b , this function is called . therefore , this is where we waant to set up and pass the event date to detailViewController.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("prepare for segue")
        
        //segue.source is where the segue is coming from
        //segue.destination os where your going.
        //detailViewController is where we are transitioning to
        //  let detailViewController = segue.destination // this make it a uiviewcontroller but we want a detailviewcontroller.
        
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        detailViewController.event = event
    }
    
    // MARK:- actions and methods
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
    }
    
    
}

// MARK:- extension


extension YellowCreateEventViewController: UITextFieldDelegate {
    // tableview requires 2 methods Textviews are optionsal methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        event.name = evenTextfield.text ?? ""
        textField.resignFirstResponder()
        
      return true
    }
    
}
