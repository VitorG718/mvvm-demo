//
//  ViewController.swift
//  MVVM-Demo
//
//  Created by Vitor Gledison Oliveira de Souza on 17/11/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    
    private var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewModel(delegate: self)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
    }

    @objc private func buttonClick() {
        viewModel?.addName(textField.text ?? "")
        textField.text = ""
        textField.endEditing(true)
    }
}

extension MainViewController: MainViewDelegate {
    func mainViewController(updateLabelWith quantity: Int) {
        label.text = "Count: \(quantity)"
    }
}

