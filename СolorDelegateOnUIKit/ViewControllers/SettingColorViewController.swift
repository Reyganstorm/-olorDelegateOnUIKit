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
        setValue(for: redTextField, greenTextField, blueTextField)
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel: label.text = string(from: redSlider)
            case greenValueLabel: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(from: redSlider)
            case greenTextField: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }

    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func setColor() {
       colorView.backgroundColor = UIColor(
           red: CGFloat(redSlider.value),
           green: CGFloat(greenSlider.value),
           blue: CGFloat(blueSlider.value),
           alpha: 1)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender{
        case redSlider:
            setValue(for: redValueLabel)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenValueLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: blueValueLabel)
            setValue(for: blueTextField)
        }
        
        setColor()
    }
    
    
    @IBAction func doneButtonPressed() {
        delegate.setColorValue(colorView.backgroundColor ?? .red)
        dismiss(animated: true)
    }
    
    
    private func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
        }
}

extension SettingColorViewController {
   
}
