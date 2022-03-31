//
//  ViewController.swift
//  СolorDelegateOnUIKit
//
//  Created by Руслан Штыбаев on 25.03.2022.
//

import UIKit

protocol SettingsColorProtocol{
    func setColorValue(_ color: UIColor)
}

class ColorViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingColorViewController
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor
    }
}

extension ColorViewController: SettingsColorProtocol {
    func setColorValue(_ color: UIColor) {
        view.backgroundColor = color
    }
}
