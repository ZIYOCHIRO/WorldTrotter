//
//  ConversionViewController.swift
//  BigNerdRanchWorldTrotter
//
//  Created by 10.12 on 2018/8/31.
//  Copyright © 2018 10.12. All rights reserved.
//

import UIKit
class ConversionViewController: UIViewController, UITextFieldDelegate{
    // MARK: Outlets
    @IBOutlet weak var celsuisLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: Properties
    var fahrenHeitValues: Double? {
        didSet {
            updateCelsuisLabel()
        }
    }
    var celsuisValue: Double? {
        if let value = fahrenHeitValues {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    // only one digit in celsuisLabel,
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = NumberFormatter.Style.decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    // MARK: Life cycle
    
    // MARK: Silver Challenge: Dark Mode
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if hour < 6 || hour > 18 {
            view.backgroundColor = UIColor.gray
        } else {
            view.backgroundColor = UIColor.white
        }
        
    }
    override func viewDidLoad() {
        // Always call the super implentation of viewDidLoad
        super.viewDidLoad()
        
        print("ConversionViewController load its view!")
    }
    
    
    
    func updateCelsuisLabel(){
        if let celsuisvalue = celsuisValue {
            celsuisLabel.text = numberFormatter.string(from: NSNumber(value: celsuisvalue))
        } else {
            celsuisLabel.text = "???"
        }
    }
    @IBAction func fahrenHeitFieldEditingChanged(_ sender: UITextField) {
        if let text = textField.text, let value = numberFormatter.number(from: text) {
            fahrenHeitValues = value.doubleValue
        } else {
            fahrenHeitValues = nil
        }
    }
    
    // keep only one deciaml seperator in the textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentLocal = NSLocale.current
        let decimalSeparator = currentLocal.decimalSeparator
        let exitingTextHasDecimalSeparator = textField.text?.contains(decimalSeparator!)
        let replacementTextHasDecimalSeparator = string.contains(decimalSeparator!)
        // MARK: Bronze Challenge: Display Alphabetic Characters
        let replacementTextHasLetter = string.rangeOfCharacter(from: CharacterSet.letters)
        if replacementTextHasLetter != nil {
            return false
        }
        if exitingTextHasDecimalSeparator! && replacementTextHasDecimalSeparator {
            return false
        }
        return true
    }
    
    // triggered by tap background view
    @IBAction func dismissKeyboard(_ sender: Any) {
        textField.resignFirstResponder()
    }
}
