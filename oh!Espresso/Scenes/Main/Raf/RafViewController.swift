//
//  RafViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 12.04.2023.
//

import UIKit
import Stevia

class RafViewController: UIViewController {

    // MARK: - Input
    private let ui = RafView()
    let uiColors = UIColors()
    
    // MARK: - Output
    var didSendEventClosure: ((RafViewController.Event) -> Void)?

    // MARK: - Methods
    private func setupView() {
    }
    
    private func updateView() {
    }
    
    
    //MARK: - Subviews
    private let mainView: UIView = {
        let view = UIView()
        return view
    }()

    private let espressoValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 11)
        label.text = "Обьем эспрессо"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()

    private let espressoValueTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "title1", size: 11)
        textField.placeholder("36")
        textField.textAlignment = .center
        textField.width(70)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()

    private let milkValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title3", size: 11)
        label.text = "Обьем Сливок"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()

    private let milkValueTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "title2", size: 11)
        textField.placeholder("70 мл")
        textField.textAlignment = .center
        textField.width(150)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let creamValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title1", size: 11)
        label.text = "Обьем молока"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let creamValueTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "title1", size: 11)
        textField.placeholder("130")
        textField.textAlignment = .center
        textField.width(150)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()

    private let calcButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calc", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.width(150)
        button.height(35)
        //button.addTarget(EspressoViewController.self, action: #selector(didTapCalcButton(_:)), for: .touchUpInside)
        return button
    }()

    private let milkResultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 11)
        label.textAlignment = .center
        label.text = "\(200) мл"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let creamResultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 11)
        label.textAlignment = .center
        label.text = "\(200) мл"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let rafResultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 11)
        label.textAlignment = .center
        label.text = "\(230) мл"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()


    
    //MARK: - Containers
    private let mainVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let espressoHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        //stackView.spacing = 10
        return stackView
    }()

    private let milkHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        //stackView.spacing = 15
        return stackView
    }()
    
    private let creamHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        //stackView.spacing = 15
        return stackView
    }()

    private let resultVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        uiColors.gradient.frame = view.bounds
        view.layer.addSublayer(uiColors.gradient)
        
        // Subviews
        mainVStackView.addArrangedSubview(espressoHStackView)
        espressoHStackView.addArrangedSubview(espressoValueLabel)
        espressoHStackView.addArrangedSubview(espressoValueTF)
        
        mainVStackView.addArrangedSubview(milkHStackView)
        milkHStackView.addArrangedSubview(milkValueLabel)
        milkHStackView.addArrangedSubview(milkValueTF)
        
        mainVStackView.addArrangedSubview(creamHStackView)
        creamHStackView.addArrangedSubview(creamValueLabel)
        creamHStackView.addArrangedSubview(creamValueTF)
        
        mainVStackView.addArrangedSubview(resultVStackView)
        resultVStackView.addArrangedSubview(milkResultLabel)
        resultVStackView.addArrangedSubview(creamResultLabel)
        resultVStackView.addArrangedSubview(rafResultLabel)
        resultVStackView.addArrangedSubview(calcButton)

        
        view.subviews(
            mainView.subviews(
                mainVStackView
            )
        )
        
        // layout
        mainView.fillContainer()
        mainVStackView.top(450)
        mainVStackView.bottom(20)
        mainVStackView.fillHorizontally(padding: 40)
       
        
    }
    
    
    
    
    deinit {
        print("LoginViewController deinit")
    }

    @objc private func didTapRafButton(_ sender: Any) {
        didSendEventClosure?(.raf)
    }
}

extension RafViewController {
    enum Event {
        case raf
    }
}
