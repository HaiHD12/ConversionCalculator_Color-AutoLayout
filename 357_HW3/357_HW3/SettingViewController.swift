//
//  SettingViewController.swift
//  357_HW3
//
//  Created by Hai Duong on 9/21/18.
//  Copyright © 2018 Hai Duong. All rights reserved.
//

import UIKit

protocol SettingViewControllerDelegate {
    func indicateSelection(from: String, to: String)
}

class SettingViewController: UIViewController {
    @IBOutlet weak var fromLabel: UIButton!
    @IBOutlet weak var toLabel: UIButton!
    
    var pickerData: [String] = [String]()
    var fromSelec : String = "Yards"
    var toSelec : String = "Meters"
    var option = "From"
    var transition = "Length"
    var delegate : SettingViewControllerDelegate?
    
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.isHidden = true
        if (transition == "Length") {
            self.pickerData = ["Yards", "Meters", "Miles"]
            self.fromSelec = "Yards"
            self.toSelec = "Meters"
            fromLabel.setTitle(fromSelec, for: .normal)
            toLabel.setTitle(toSelec, for: .normal)
        } else {
            self.pickerData = ["Gallons", "Liters", "Quarts"]
            self.fromSelec = "Gallons"
            self.toSelec = "Liters"
            fromLabel.setTitle(fromSelec, for: .normal)
            toLabel.setTitle(toSelec, for: .normal)
        }
        
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func fromOp(_ sender: Any) {
        option = "From"
        picker.isHidden = false
    }
    
    @IBAction func toOp(_ sender: Any) {
        option = "To"
        picker.isHidden = false
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        if let d = self.delegate {
            d.indicateSelection(from: fromSelec, to: toSelec)
        }
        self.dismiss(animated: true, completion: nil)
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

extension SettingViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    //The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if option == "From"{
            self.fromSelec = self.pickerData[row]
            fromLabel.setTitle(fromSelec, for: .normal)
        } else {
            self.toSelec = self.pickerData[row]
            toLabel.setTitle(toSelec, for: .normal)
        }
        picker.isHidden = true
    }
}
