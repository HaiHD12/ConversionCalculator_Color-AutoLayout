//
//  ViewController.swift
//  357_HW3
//
//  Created by Hai Duong on 9/17/18.
//  Copyright © 2018 Hai Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, SettingViewControllerDelegate {
    
    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var fromInput: UITextField!
    @IBOutlet weak var toOutput: UITextField!
    var transition = "Length"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dissmissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        // Do any additional setup after loading the view, typically from a nib.
    
        self.view.backgroundColor = BACKGROUND_COLOR
        
    }

    
    @objc func dissmissKeyboard() {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func indicateSelection(from: String, to: String) {
        self.fromLabel.text = "\(from)"
        self.toLabel.text = "\(to)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination.childViewControllers[0] as? SettingViewController {
            dest.delegate = self
            dest.transition = transition
        }
    }
    
    
    @IBAction func Calculate(_ sender: Any) {
        self.view.endEditing(true)
        let input = fromInput.text
        let output = toOutput.text
        let from = fromLabel.text
        let to = toLabel.text
        
        let i = NSString(string: input!).doubleValue
        let o = NSString(string: output!).doubleValue
        
        if (input != "") {
            toOutput.text = "\(convert(from: from!, to: to!, i: i))"
        } else {
            fromInput.text = "\(convert(from: to!, to: from!, i: o))"
        }
    
    }
        
        
    func convert(from: String, to: String, i: Double) -> Double {
        if (from == "Yards"){
            if (to == "Yards") {
                return i
            } else if (to == "Meters") {
                return i * 0.9144
            } else if (to == "Miles") {
                return i * 0.000568182
            }
            
        } else if (from == "Meters"){
            if (to == "Meters") {
                return i
            } else if (to == "Yards") {
                return i * 1.09361
            } else if (to == "Miles") {
                return i * 0.000621371
            }
            
        } else if (from == "Miles") {
            if (to == "Miles") {
                return i
            } else if (to == "Yards") {
                return i * 1760.0
            } else if (to == "Meters") {
                return i * 1609.34
            }
        }
        
        if (from == "Gallons") {
            if (to == "Gallons") {
                return i
            } else if (to == "Liters") {
                return i * 3.78541
            }else if (to == "Quarts") {
                return i * 4.0
            }
            
        } else if (from == "Liters") {
            if (to == "Liters") {
                return i
            } else if (to == "Gallons") {
                return i * 0.264172
            } else if (to == "Quarts") {
               return i * 1.05669
            }
            
        } else if (from == "Quarts") {
            if (to == "Quarts") {
                return i
            } else if (to == "Gallons") {
                return i * 0.25
            } else if (to == "Liters") {
                return i * 0.946353
            }
        }
        return 0.0
    }
    
    
    @IBAction func Mode(_ sender: Any) {
       self.view.endEditing(true)
        let title = Header.text
        
        if (title == "Length Conversion Calculator") {
            Header.text = "Volume Conversion Calculator"
            fromLabel.text = "Gallons"
            toLabel.text = "Liters"
            transition = "Volume"
        } else if (title == "Volume Conversion Calculator") {
            Header.text = "Length Conversion Calculator"
            fromLabel.text = "Yards"
            toLabel.text = "Meters"
            transition = "Length"
            
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        self.view.endEditing(true)
        fromInput.text = ""
        toOutput.text = ""
       
    }
}

