//
//  Calculator.swift
//  Calculator
//
//  Created by Krupa Rana on 5/11/18.
//  Copyright © 2018 Ronak Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var presentNo:Double = 0;
    var previousNo: Double = 0;
    var operation = false;
    var calculation = 0;
    @IBOutlet weak var userInput: UILabel!
    
    @IBAction func num(_ sender: UIButton)
    {
        if operation == true
        {
            userInput.text = String(sender.tag-1)
            presentNo = Double(userInput.text!)!
            operation = false
        }
        else
        {
            userInput.text=userInput.text! + String(sender.tag-1)
            presentNo = Double(userInput.text!)!
        }
    }
    @IBAction func arithmeticOperations(_ sender: UIButton)
    {
        if userInput.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNo = Double(userInput.text!)!
            switch String(sender.tag)
            {
            case "12": //Divide operation
                userInput.text = "/"
            case "13": //Multiply operation
                userInput.text = "X"
            case "14": //Minus operation
                userInput.text = "-"
            case "15": //Plus operation
                userInput.text = "+"
            default:
                print("Wrong button pressed. Try again!")
            }
            calculation = sender.tag
            operation = true;
        }
        else if sender.tag == 16
        {
            if calculation == 12
            {
                userInput.text = String(previousNo / presentNo)
            }
            else if calculation == 13
            {
                userInput.text = String(previousNo * presentNo)
            }
            else if calculation == 14
            {
                userInput.text = String(previousNo - presentNo)
            }
            else if calculation == 15
            {
                userInput.text = String(previousNo + presentNo)
            }
        }
        else if sender.tag == 11
        {
            userInput.text = ""
            previousNo = 0;
            presentNo = 0;
            calculation = 0;
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

