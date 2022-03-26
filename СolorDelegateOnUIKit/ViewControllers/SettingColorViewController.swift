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
    
    var colorValue: ColorValue!
    var delegate: SettingsColorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 30
        doneButtone.layer.cornerRadius = 15
        setColor()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
//        redTextField.text = String(colorValue.redValue)
//        greenTextField.text = String(colorValue.greenValue)
//        blueTextField.text = String(colorValue.blueValue)
        
    }
    
    private func setColor() {
       colorView.backgroundColor = UIColor(
           red: CGFloat(redSlider.value),
           green: CGFloat(greenSlider.value),
           blue: CGFloat(blueSlider.value),
           alpha: 1)
   }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
            case redSlider:
            redValueLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        
            case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        
            default:
            blueValueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }

    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setColorValue(for: colorValue)
        dismiss(animated: true)
    }
    
    
    private func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
        }
}

extension SettingColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Double(newValue) else { return }
        
        if textField == redTextField {
            colorValue.redValue = numberValue
        } else if textField == greenTextField {
            colorValue.greenValue = numberValue
        } else {
            colorValue.blueValue = numberValue
        }
    }
}
