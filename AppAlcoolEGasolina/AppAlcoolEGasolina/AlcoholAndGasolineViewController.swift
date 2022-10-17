//
//  ViewController.swift
//  AppAlcoolEGasolina
//
//  Created by Marcelo Falcao Costa Filho on 29/09/22.
//

import UIKit

class AlcoholAndGasolineViewController: UIViewController {
    
    var alcoholAndGasoline: AlcoholAndGasolineScreen?
    
    override func loadView() {
        self.alcoholAndGasoline = AlcoholAndGasolineScreen()
        self.view = alcoholAndGasoline
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alcoholAndGasoline?.delegate(delegate: self)
        alcoholAndGasoline?.configTextFieldDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension AlcoholAndGasolineViewController: AlcoholAndGasolineScreenProtocol {
    func actionCalculateButton() {
        
        if let ethanolPrice = Double(alcoholAndGasoline?.alcoholTextField.text ?? "0.0"), let gasoline = Double(alcoholAndGasoline?.gasolineTextField.text ?? "0.0") {
            if (ethanolPrice / gasoline) > 0.7 {
                alcoholAndGasoline?.bestLabel.text = "Pelo comparativo, a melhor alternativa é encher com gasolina"
            } else {
                alcoholAndGasoline?.bestLabel.text = "Pelo comparativo, a melhor alternativa é encher com álcool"
            }
        }
    }
}

extension AlcoholAndGasolineViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        alcoholAndGasoline?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
