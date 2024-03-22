//
//  ViewController.swift
//  TextFieldsApp
//
//  Created by Scott Valair on 2024-03-20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

// MARK: Outlets
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!

// MARK: Properties
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    var unifiedDelegate: UnifiedTextFieldDelegate?

// MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField1.delegate = zipCodeDelegate
        textField2.delegate = cashDelegate
        unifiedDelegate = UnifiedTextFieldDelegate(editingSwitch: editingSwitch)
        textField3.delegate = unifiedDelegate

        editingSwitch.setOn(false, animated: false)
    }

// MARK: Text Field Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return textField != textField3 || editingSwitch.isOn
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

// MARK: Actions
    
    @IBAction func toggleTheTextEditor(_ sender: UISwitch) {
        if !sender.isOn {
            textField3.resignFirstResponder()
        }
    }
}

