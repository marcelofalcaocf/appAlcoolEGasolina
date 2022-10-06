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
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

