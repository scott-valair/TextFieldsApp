//
//  RandomColorTextFieldDelegate.swift
//  TextFieldsApp
//
//  Created by Scott Valair on 2024-03-20.
//

import Foundation
import UIKit

// MARK: - RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate

import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    weak var editSwitch: UISwitch?
    let colors = [UIColor.red, 
                  UIColor.orange,
                  UIColor.yellow,
                  UIColor.green,
                  UIColor.blue,
                  UIColor.purple,
                  UIColor.brown]
    
    // Add this initializer
    init(editSwitch: UISwitch) {
        self.editSwitch = editSwitch
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // Check if editing is allowed based on the switch's state
        return editSwitch?.isOn ?? false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = self.randomColor()
        return true
    }
    
    private func randomColor() -> UIColor {
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        return colors[randomIndex]
    }
}


