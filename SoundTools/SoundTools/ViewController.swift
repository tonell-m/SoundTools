//
//  ViewController.swift
//  SoundTools
//
//  Created by Marceau Tonelli on 03/10/2016.
//  Copyright © 2016 Marceau Tonelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    
    //Header
    @IBOutlet weak var roomTextField: UITextField!
    @IBOutlet weak var roomCapacityTextField: UITextField!
    @IBOutlet weak var writerTextField: UITextField!
    @IBOutlet weak var temperatureTextField: UITextField!
    
    
    //Footer
    @IBOutlet weak var toolsDelayTextField: UITextField!
    @IBOutlet weak var toolsDistanceTextField: UITextField!
    @IBOutlet weak var toolsWaveLengthTextField: UITextField!
    @IBOutlet weak var toolsFrequencyTextField: UITextField!
    @IBOutlet weak var toolsPeriodTextField: UITextField!
    @IBOutlet weak var toolsTemperatureTextField: UITextField!
    
    
    
    //Numpad toolBar
    let numpadToolBar = UIToolbar()

    //MARK: Class functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Watch keyboard show/hide events
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        //Add a "Done" button to numpad keyboard
        initNumericKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Custom functions
    
    //Lift up view when keyboard shown
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    //Get view back to normal when keyboard hidden
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y > 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func hideKeyboard() {
        self.view.frame.origin.y = 0
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func initNumericKeyboard() {
        
        numpadToolBar.barStyle = UIBarStyle.blackTranslucent
        
        numpadToolBar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ViewController.hideKeyboard))
        ]
        
        numpadToolBar.sizeToFit()
        
        roomCapacityTextField.inputAccessoryView = numpadToolBar
        temperatureTextField.inputAccessoryView = numpadToolBar
        
        toolsDelayTextField.inputAccessoryView = numpadToolBar
        toolsWaveLengthTextField.inputAccessoryView = numpadToolBar
        toolsFrequencyTextField.inputAccessoryView = numpadToolBar
        toolsDistanceTextField.inputAccessoryView = numpadToolBar
        toolsTemperatureTextField.inputAccessoryView = numpadToolBar
        toolsPeriodTextField.inputAccessoryView = numpadToolBar
    }

}

