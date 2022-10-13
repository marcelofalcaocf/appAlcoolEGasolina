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
        let ethanolPrice: Double = Double(alcoholAndGasoline?.alcoholLabel.text ?? "0.0") ?? 0.0
        let gasolinePrice: Double = Double(alcoholAndGasoline?.gasolinelLabel.text ?? "0.0") ?? 0.0
        
        if ethanolPrice / gasolinePrice > 0.7 {
            alcoholAndGasoline?.bestLabel.text = "Melhor utilizar Gasolina"
        } else {
            alcoholAndGasoline?.bestLabel.text = "Melhor utilizar Álcool"
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
