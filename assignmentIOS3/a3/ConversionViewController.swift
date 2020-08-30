//  Assignment 3
//  Programmer: Andy Olivares
//  z-id: z1860934
//  class: CSCI 321
//  Due date: 4/10/2020
//  ConversionViewController.swift
//  a3
//
//  Created by Andy Olivares on 4/3/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var conversionSelector: UISegmentedControl!
    @IBOutlet weak var pickerValues: UIPickerView!
    @IBOutlet weak var showTemp: UILabel!
    
    //holds fahrenheit numbers
    let numbersF: [Int] = Array(-129...134)
    //holds celcius numbers
    let numbersC: [Int] = Array(-90...57)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerValues.delegate = self
        self.pickerValues.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    /*
     function that returns number of components
     -Parameter: Default
     -Returns: Number of components
     */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
     function that gets the number of rows in the pickerView
     -Parameter: Default
     -Returns: Int (rows)
     */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let conversionType = conversionSelector.selectedSegmentIndex
        if(conversionType == 0){
            //returns number of rows of fahrenheit
            return numbersF.count
        }
        //returns number of rows for celsisus
        return numbersC.count
    }
    
    /*
     function that gets what row is selected
     -Parameter: Default
     -Returns: row selected
     */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?{
        let conversionType = conversionSelector.selectedSegmentIndex
        if(conversionType == 0){
            let numbersFahrenheitString = numbersF.map{String($0)}
            return numbersFahrenheitString[row]
        }
            let numbersCelsiusString = numbersC.map{String($0)}
            return numbersCelsiusString[row]
    }
    
    /*
     function that reloads pickerView when fahrenheit or celsius is clicked
     -Parameter: Default
     -Returns: Nothing
     */
    @IBAction func tempSwitch(_ sender: Any) {
        pickerValues.reloadAllComponents()
    }
    
    
    /*
     function: convertButton
     usage: converts between celsius to fahrenheit/ fahrenheit to celsius
     -Parameter: Default
     -Returns: nothing
     */
    @IBAction func convertButton(_ sender: Any) {
        let conversionType = conversionSelector.selectedSegmentIndex
        if(conversionType == 0){
            let selectedF = numbersF[pickerValues.selectedRow(inComponent: 0)]
            let selectedValue = Int(selectedF)
            showTemp.text = String(Celsius(Fval: selectedValue))
            
        }else if(conversionType == 1){
            let selectedC = numbersC[pickerValues.selectedRow(inComponent: 0)]
            let selectedValue = Int(selectedC)
            showTemp.text = String(Fahrenheit(Cval: selectedValue))
        }
    }
    
    
    /*
     function: Celsius
     -Parameter: Int Fval: fahrenheit value to be converted
     -Returns: Int (celsius)
     */
    func Celsius(Fval: Int)->Int{
        let celsiusVal = Int(Double(Fval - 32) * (5/9))
        return celsiusVal
    }
    
    
    /*
     function that gets call when the button to calculate the dog's age is touched/clicked
     -Parameter: Int Cval: celsisu value to be converted
     -Returns: Int (fahrenheit)
     */
    func Fahrenheit(Cval: Int)->Int{
        let fahrenheitVal = Int((Int(Double(Cval)*1.8))+32)
        return fahrenheitVal
    }
    
}

