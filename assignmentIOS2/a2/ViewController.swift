//
//  ViewController.swift
//  a2
//
//  Created by Andy Olivares on 4/3/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var numberPartyLabel: UILabel!
    
    
    @IBOutlet weak var shareLabel: UILabel!
    
    
    @IBOutlet weak var partyShareSlider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    /*
     function tipPercentagAction
     parameters: sender: UISlider
     shows the tip percentage
     */
    @IBAction func tipPercentageAction(_ sender: UISlider) {
        var tipPercentageValue = Int(sender.value)
        tipPercentageLabel.text = String(tipPercentageValue)
        billAmountLabel.text = String(calculatePercentage(tipPercentage: tipPercentageValue))
    }
    
    
    /*
     function partySizeAction
     parameters: sender: UISlider
     shows the amount of people
     */
    @IBAction func partySizeAction(_ sender: UISlider) {
        var partySizeValue = Int(sender.value)
        numberPartyLabel.text = String(partySizeValue)
        shareLabel.text = String(calculatePartySize(total_party: Float(partySizeValue)))
    }
    
    /*
     function calculatePercentage
     parameters: function type int
     calculates the tip percentage
     */
    func calculatePercentage(tipPercentage: Int)-> Int{
        var billAmount  = Int(billAmountTextField.text!)
        var total_bill_amount = billAmount! + tipPercentage
        return total_bill_amount
    }
    
    
    /*
     function calculatePartySize
     parameters: function type float
     calculates how much a person is going to pay
     */
    func calculatePartySize(total_party: Float)->Float{
        let billParty = Float(billAmountLabel.text!)
        var total_bill_party = billParty! / Float(total_party)
        return total_bill_party
    }
    
    /*
     function touchBegan
     parametes: none
     hides keyboard
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

