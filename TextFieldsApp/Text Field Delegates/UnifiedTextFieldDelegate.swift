//
//  UnifiedTextFieldDelegate.swift
//  TextFieldsApp
//
//  Created by Scott Valair on 2024-03-22.
//

import UIKit

// MARK: - UnifiedTextFieldDelegate: NSObject, UITextFieldDelegate

class UnifiedTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // MARK: - Properties
    
    weak var editingSwitch: UISwitch?
    let colors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.brown]
    
    // MARK: - Initialization
    
    init(editingSwitch: UISwitch) {
        self.editingSwitch = editingSwitch
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return editingSwitch?.isOn ?? true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = randomColor()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Helper Methods
    
    private func randomColor() -> UIColor {
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        return colors[randomIndex]
    }
}

