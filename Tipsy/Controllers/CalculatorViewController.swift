//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    var tip = "0.0"
    var tipDecimal = 0.0
    var billTotal = 0.0
    var numberOfPeople = 0
    var settings: String = ""
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
   
   
   override func viewDidLoad() {
        super.viewDidLoad()
      
       billTextField.becomeFirstResponder()
      
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        tip = sender.currentTitle!
        tip = String(tip.dropLast())
        tipDecimal = Double(tip)! / 100
        billTextField.endEditing(true)
        
    }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
        numberOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
       let billl = billTextField.text!
       let bill = billl.replacingOccurrences(of: ",", with: ".")
        if bill != "" {
            billTotal = Double(bill)!
            let result = (billTotal + (billTotal * tipDecimal)) / Double(numberOfPeople)
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            print(resultTo2DecimalPlaces)
            
          
            
           
        }
        settings = "Split between \(numberOfPeople) people,with a \(tip)% tip."
    
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
      
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.settingsText = settings
           
        }
    }
}

