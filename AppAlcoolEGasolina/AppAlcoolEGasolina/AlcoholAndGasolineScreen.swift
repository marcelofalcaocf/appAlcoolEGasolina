//
//  AlcoholAndGasolineScreen.swift
//  AppAlcoolEGasolina
//
//  Created by Marcelo Falcao Costa Filho on 04/10/22.
//

import UIKit

protocol AlcoholAndGasolineScreenProtocol: AnyObject {
    func actionCalculateButton()
}

class AlcoholAndGasolineScreen: UIView {
    
    private weak var delegate: AlcoholAndGasolineScreenProtocol?
    
    func delegate(delegate: AlcoholAndGasolineScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var fuelImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "FuelPump")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // seta as constraints de maneira automatica, e nao queremos isso
        label.textColor = .black // cor da fonte da escrita
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Álcool ou Gasolina"
        return label
    }()
    
    lazy var callLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // seta as constraints de maneira automatica, e nao queremos isso
        label.textColor = .black // cor da fonte da escrita
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Insira os valores do litro de combustível"
        return label
    }()
    
    lazy var alcoholTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no // para correção automatica do teclado, nesse caso desativado
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad // estilo do teclado para quem vai escrever numero
        textField.placeholder = "Ex: 2.70"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var gasolineTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no // para correção automatica do teclado, nesse caso desativado
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad // estilo do teclado para quem vai escrever numero
        textField.placeholder = "Ex: 3.47"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var alcoholLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // seta as constraints de maneira automatica, e nao queremos isso
        label.textColor = .black // cor da fonte da escrita
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "Álcool"
        return label
    }()
    
    lazy var gasolinelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // seta as constraints de maneira automatica, e nao queremos isso
        label.textColor = .black // cor da fonte da escrita
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "Gasolina"
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18) // tamanho da fonte
        button.setTitleColor(.white, for: .normal) // cor para o texto
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(self.tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    lazy var bestLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // seta as constraints de maneira automatica, e nao queremos isso
        label.textAlignment = .center
        label.textColor = .black // cor da fonte da escrita
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "O melhor é ..."
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSubView()
        configBackGround()
        
        configFuelImage()
        configHeaderLabel()
        configCallLabel()
        configAlcoholTextField()
        configGasolineTextField()
        configAlcoholLabel()
        configGasolinelLabel()
        configCalculateButton()
        configBestLabel()
    }
    
    private func configSubView() {
        addSubview(fuelImage)
        addSubview(headerLabel)
        addSubview(callLabel)
        addSubview(alcoholTextField)
        addSubview(gasolineTextField)
        addSubview(alcoholLabel)
        addSubview(gasolinelLabel)
        addSubview(calculateButton)
        addSubview(bestLabel)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.alcoholTextField.delegate = delegate
        self.gasolineTextField.delegate = delegate
    }
    
    private func configBackGround() {
        self.backgroundColor = UIColor(red: 254/255, green: 220/255, blue: 53/255, alpha: 1.0)
    }
    
    @objc private func tappedCalculateButton() {
        self.delegate?.actionCalculateButton()
    }
    
    public func validaTextFields() {
        let alcohol: Double = Double(alcoholTextField.text ?? "0.0") ?? 0.0
        let gasoline: Double = Double(gasolineTextField.text ?? "0.0") ?? 0.0
        
        if alcohol != 0 && gasoline != 0 {
            configButtonEnabel(true)
        } else {
            configButtonEnabel(false)
        }
    }
    
    private func configButtonEnabel(_ enabel: Bool) {
        if enabel {
            self.calculateButton.setTitleColor(.white, for: .normal)
            self.calculateButton.isEnabled = true // permitido apertar o botao "isEnabled"
        } else {
            self.calculateButton.setTitleColor(.lightGray, for: .normal)
            self.calculateButton.isEnabled = false // nao permitido apertar o botao
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configFuelImage() {
        fuelImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(250)
        }
    }
    
    private func configHeaderLabel() {
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(self.fuelImage.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configCallLabel() {
        callLabel.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func configAlcoholTextField() {
        alcoholTextField.snp.makeConstraints { make in
            make.top.equalTo(self.callLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(130)
        }
    }
    
    private func configGasolineTextField() {
        gasolineTextField.snp.makeConstraints { make in
            make.top.equalTo(self.callLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(130)
        }
    }
    
    private func configAlcoholLabel() {
        alcoholLabel.snp.makeConstraints { make in
            make.top.equalTo(self.alcoholTextField.snp.bottom).offset(5)
            make.leading.equalTo(self.alcoholTextField.snp.leading)
            make.width.equalTo(self.alcoholTextField.snp.width)
        }
    }
    
    private func configGasolinelLabel() {
        gasolinelLabel.snp.makeConstraints { make in
            make.top.equalTo(self.gasolineTextField.snp.bottom).offset(5)
            make.leading.equalTo(self.gasolineTextField.snp.leading)
            make.width.equalTo(self.gasolineTextField.snp.width)
        }
    }
    
    private func configCalculateButton() {
        calculateButton.snp.makeConstraints { make in
            make.top.equalTo(self.alcoholLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    private func configBestLabel() {
        bestLabel.snp.makeConstraints { make in
            make.top.equalTo(calculateButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
