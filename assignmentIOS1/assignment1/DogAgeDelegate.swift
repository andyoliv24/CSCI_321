//Dog Age Delegate
//Programmer: Andy Olivares
//z-id: z1860934
//class: CSCI 321
//Due date: 2/18/2020
//
//  DogAgeDelegate.swift
//  assignment1
//
//  Created by Andy Olivares on 2/4/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import UIKit
import Foundation

class DogAgeDelegate: NSObject, UITextFieldDelegate {
     /**
            Calculates the dog's age
                -Parameter: Takes the dog's age of type Int
                -Returns: dog's age in human years
     */
    func getDogAge(age: Int)-> Int{
        var realAge = age
        //checks if dog's age is 1
        if(age == 1){
            realAge = 1 * 15
        //checks if dog's age is 2
        }else if(age == 2){
            realAge = (1*15) + (1*9)
        //checks if dog's age is greather than 2
        }else if(age > 2){
            realAge = (1*15) + (1*9) + (age * 5)
        }
        return realAge
    }

}
