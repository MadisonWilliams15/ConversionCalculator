//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Madison Williams on 7/10/18.
//  Copyright © 2018 Madison Williams. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    struct Converter {
        var label : String
        var inputUnit : String
        var outputUnit : String
    }

    var currentConverter: Converter?
    var currentInput : Number?
    var converters = [Converter]()
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBOutlet weak var outputDisplay: UITextField!
   
    @IBAction func zeroPressed(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(0))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func onePressed(_ sender: Any) {
       inputDisplay.text = (currentInput?.append(1))! + " " + currentConverter!.inputUnit
       updateConversion()
        
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(2))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func threePressed(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(3))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(4))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(5))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func sixPressed(_ sender: Any) {
       inputDisplay.text = (currentInput?.append(6))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func sevenPressed(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(7))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func eightPressed(_ sender: Any) {
       inputDisplay.text = (currentInput?.append(8))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func ninePressed(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(9))! + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        currentInput?.clear()
        inputDisplay.text = (currentInput?.number)! + " " + currentConverter!.inputUnit
        outputDisplay.text = (currentInput?.number)! + " " + currentConverter!.outputUnit
    }
    
    @IBAction func negativePressed(_ sender: Any) {
            currentInput?.negative()
            inputDisplay.text = (currentInput?.number)! + " " + currentConverter!.inputUnit
            updateConversion()
            
        }
    
    
    @IBAction func decimalPressed(_ sender: Any) {
        currentInput?.decimal()
        inputDisplay.text = currentInput!.number + " " + currentConverter!.inputUnit
        updateConversion()
    }
    
    
    func updateConversion(){
        if currentConverter?.label == "fahrenheit to celcius" && currentInput?.number != ""{
            if let num = Double(currentInput!.number){
            outputDisplay.text = String((num - 32 ) * (5/9)) + " " + currentConverter!.outputUnit
            }
        }
        
        if currentConverter?.label == "celcius to fahrenheit" && currentInput?.number != ""{
            outputDisplay.text = String( Double(currentInput!.number)! * (9/5) + 32) + " " + currentConverter!.outputUnit
        }
        
        if currentConverter?.label == "miles to kilometers" && currentInput?.number != ""{
            outputDisplay.text = String( Double(currentInput!.number)! * 1.609344) + " " + currentConverter!.outputUnit
        }
        
        if currentConverter?.label == "kilometers to miles" && currentInput?.number != ""{
            outputDisplay.text = String( Double(currentInput!.number)! / 1.609344) + " " + currentConverter!.outputUnit
        }
        
    }
    
    @IBAction func convertPressed(_ sender: UIButton) {
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        optionMenu.addAction(UIAlertAction(title: converters[0].label, style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currentConverter = self.converters[0]
            self.inputDisplay.text = self.currentInput!.number + " " + self.currentConverter!.inputUnit
            self.outputDisplay.text = " " + self.currentConverter!.outputUnit
            self.updateConversion()
        }))
        
        optionMenu.addAction(UIAlertAction(title: converters[1].label, style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currentConverter = self.converters[1]
            self.inputDisplay.text = self.currentInput!.number + " " + self.currentConverter!.inputUnit
            self.outputDisplay.text = " " + self.currentConverter!.outputUnit
            self.updateConversion()
        }))
        
        
        optionMenu.addAction( UIAlertAction(title: converters[2].label, style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currentConverter = self.converters[2]
            self.inputDisplay.text = self.currentInput!.number + " " + self.currentConverter!.inputUnit
            self.outputDisplay.text = " " + self.currentConverter!.outputUnit
            self.updateConversion()
        }))
        
        optionMenu.addAction( UIAlertAction(title: converters[2].label, style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currentConverter = self.converters[3]
            self.inputDisplay.text = self.currentInput!.number + " " + self.currentConverter!.inputUnit
            self.outputDisplay.text = " " + self.currentConverter!.outputUnit
            self.updateConversion()
        }))
   
        self.present(optionMenu, animated: true, completion: nil)
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        converters.append(Converter(label : "fahrenheit to celcius", inputUnit : "°F", outputUnit : "°C" ))
        converters.append(Converter(label : "celcius to fahrenheit", inputUnit : "°C", outputUnit : "°F" ))
        converters.append(Converter(label : "miles to kilometers", inputUnit : "mi", outputUnit : "km" ))
        converters.append(Converter(label : "kilometers to miles", inputUnit : "km", outputUnit : "mi"))
        
        currentConverter = converters[0] //set default converter
        
        currentInput = Number()
        inputDisplay.text = currentInput!.number + " " + currentConverter!.inputUnit
        outputDisplay.text = currentInput!.number + " " + currentConverter!.outputUnit
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
