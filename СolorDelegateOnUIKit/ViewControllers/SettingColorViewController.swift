//
//  SettingColorViewController.swift
//  СolorDelegateOnUIKit
//
//  Created by Руслан Штыбаев on 25.03.2022.
//

import UIKit

class SettingColorViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var doneButtone: UIButton!
    
    var viewColor: UIColor!
    var delegate: SettingsColorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 30
        doneButtone.layer.cornerRadius = 15
        
        colorView.backgroundColor = viewColor
        
        setSliders()
    }
    


    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
//    @IBAction func doneButtonPressed() {
//        view.endEditing(true)
//        delegate.setColorValue(for: double(from: redTextField), for: double(from: greenTextField), and: double(from: blueTextField))
//        dismiss(animated: true)
//    }
    
    
    private func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
        }
}

extension SettingColorViewController {
   
}
