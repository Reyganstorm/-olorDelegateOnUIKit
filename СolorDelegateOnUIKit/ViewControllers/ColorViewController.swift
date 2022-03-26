//
//  ViewController.swift
//  СolorDelegateOnUIKit
//
//  Created by Руслан Штыбаев on 25.03.2022.
//

import UIKit

protocol SettingsColorProtocol{
    func setColorValue( for colorValue: ColorValue)
}

class ColorViewController: UIViewController {
    
    var red: CGFloat = 1
    var green: CGFloat = 1
    var blue: CGFloat = 1
    
    private var colorValue = ColorValue(
        redValue: 1,
        greenValue: 1,
        blueValue: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        red = CGFloat(colorValue.redValue)
        green = CGFloat(colorValue.greenValue)
        blue = CGFloat(colorValue.blueValue)
        
        setColor()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingColorViewController else { return }
        settingsVC.colorValue = colorValue
        settingsVC.delegate = self
    }
    
    private func setColor() {
       view.backgroundColor = UIColor(
           red: red,
           green: green,
           blue: blue,
           alpha: 1)
   }

}

extension ColorViewController: SettingsColorProtocol {
    func setColorValue(for colorValue: ColorValue) {
        red = CGFloat(colorValue.redValue)
        green = CGFloat(colorValue.greenValue)
        blue = CGFloat(colorValue.blueValue)
        self.colorValue = colorValue
    }
    
}
