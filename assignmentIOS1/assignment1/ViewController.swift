//Assignment 1
//Programmer: Andy Olivares
//z-id: z1860934
//class: CSCI 321
//Due date: 2/18/2020
//
//  ViewController.swift
//  assignment1
//
//  Created by Andy Olivares on 2/4/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    //age text field outlet
    @IBOutlet weak var ageTextField: UITextField!
    //output field outlet
    @IBOutlet weak var outputLabel: UILabel!
    
    //creates a delegate class
    let Dogdelegate = DogAgeDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
        /**
        function that gets call when the button to calculate the dog's age is touched/clicked
        -Parameter: Default
        -Returns: Nothing
     */
    @IBAction func calculateButton(_ sender: Any) {
        //checks if text field for dog's age is empty, if so, calls showAlert
            guard let age = ageTextField.text, !age.isEmpty else{
                showAlert("Please enter an age for your dog")
            return
        }
        
        //gets dog age from text field
        var DogAge = Dogdelegate.getDogAge(age: Int(age)!)
        outputLabel.text = "Your dog's age is \(DogAge)"
    }
    
    /**
        gets string to later show it to the user
        -Parameter: A String which will be displayed to the user's interface
        -Returns: Nothing
     */
    func showAlert(_ message: String){
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    /**
        Takes care of hiding the keyboard
        -Parameter: Default parameter of the touchesBegan function
        -Returns: Nothing
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

