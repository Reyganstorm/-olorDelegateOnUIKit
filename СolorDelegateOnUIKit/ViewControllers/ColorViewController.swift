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
        guard let settingsVC = segue.destination as? SettingColorViewController else {return}
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor ?? .white
    }
}

extension ColorViewController: SettingsColorProtocol {
    func setColorValue(_ color: UIColor) {
        view.backgroundColor = color
    }
}
