//
//  LatteViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 10.04.2023.
//

import UIKit
import Stevia

class LatteViewController: UIViewController {

    // MARK: - Input
    let uiColors = UIColors()

    // MARK: - Output
     var didSendEventClosure: ((LatteViewController.Event) -> Void)?

    
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

    private let valueMilkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title1", size: 11)
        label.text = "Обьем молока"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()

    private let valueMilkTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "title1", size: 11)
        textField.placeholder("7 частей")
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

    private let resultMilkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 11)
        label.textAlignment = .center
        label.text = "\(200) мл"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let resultLatteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 11)
        label.textAlignment = .center
        label.text = "\(230) мл"
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()


    
    //MARK: - Containers
    private let mainVericalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let espressoHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        //stackView.spacing = 10
        return stackView
    }()

    private let milkHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        //stackView.spacing = 15
        return stackView
    }()

    private let resultVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        uiColors.gradient.frame = view.bounds
        view.layer.addSublayer(uiColors.gradient)
        
//        mainView.backgroundColor = .white
//        mainVericalStackView.backgroundColor = .systemGray3
//        espressoHorizontalStackView.backgroundColor = .systemGray4
//        milkHorizontalStackView.backgroundColor = .systemGray4
//        resultVerticalStackView.backgroundColor = .systemGray4

        
        // Subviews
        mainVericalStackView.addArrangedSubview(espressoHorizontalStackView)
        espressoHorizontalStackView.addArrangedSubview(espressoValueLabel)
        espressoHorizontalStackView.addArrangedSubview(espressoValueTF)
        
        mainVericalStackView.addArrangedSubview(milkHorizontalStackView)
        milkHorizontalStackView.addArrangedSubview(valueMilkLabel)
        milkHorizontalStackView.addArrangedSubview(valueMilkTF)
        
        mainVericalStackView.addArrangedSubview(resultVerticalStackView)
        resultVerticalStackView.addArrangedSubview(resultMilkLabel)
        resultVerticalStackView.addArrangedSubview(resultLatteLabel)
        resultVerticalStackView.addArrangedSubview(calcButton)

        
        view.subviews(
            mainView.subviews(
                mainVericalStackView
            )
        )
        
        // layout
        mainView.fillContainer()
        mainVericalStackView.top(450)
        mainVericalStackView.bottom(20)
        mainVericalStackView.fillHorizontally(padding: 40)
        
    }


    @objc private func didTapToInstructionButton(_ sender: Any) {
       // didSendEventClosure?(.latte)
    }
}

extension LatteViewController {
    enum Event {
        case latte
    }
}
