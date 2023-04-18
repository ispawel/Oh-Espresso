//
//  LatteViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 10.04.2023.
//

import UIKit
import Stevia

class LatteViewController: UIViewController {

    var didSendEventClosure: ((LatteViewController.Event) -> Void)?

    
    //MARK: - Subviews
    private let mainView: UIView = {
        let view = UIView()
        return view
    }()

    private let espressoValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 12)
        label.text = "Обьем эспрессо"
        label.width(150)
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()

    private let espressoValueTF: UITextField = {
        let textField = UITextField()
        textField.placeholder("36")
        textField.textAlignment = .center
        textField.backgroundColor = .systemBlue
        textField.width(150)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()

    private let valueMilkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title1", size: 12)
        label.text = "Обьем молока"
        label.width(150)
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()

    private let valueMilkTF: UITextField = {
        let textField = UITextField()
        textField.placeholder("7 частей")
        textField.textAlignment = .center
        textField.backgroundColor = .systemBlue
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

    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 12)
        label.textAlignment = .center
        label.text = "230 мл"
        label.width(150)
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
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

    private let milkHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        view.backgroundColor = .darkGray
        mainView.backgroundColor = .systemGray3
        mainVericalStackView.backgroundColor = .systemGray4
        espressoHorizontalStackView.backgroundColor = .systemGray5
        milkHorizontalStackView.backgroundColor = .systemGray5
        resultVerticalStackView.backgroundColor = .systemGray5

        
        // Subviews
        mainVericalStackView.addArrangedSubview(espressoHorizontalStackView)
        espressoHorizontalStackView.addArrangedSubview(espressoValueLabel)
        espressoHorizontalStackView.addArrangedSubview(espressoValueTF)
        
        mainVericalStackView.addArrangedSubview(milkHorizontalStackView)
        milkHorizontalStackView.addArrangedSubview(valueMilkLabel)
        milkHorizontalStackView.addArrangedSubview(valueMilkTF)
        
        mainVericalStackView.addArrangedSubview(resultVerticalStackView)
         resultVerticalStackView.addArrangedSubview(resultLabel)
         resultVerticalStackView.addArrangedSubview(calcButton)

        
        view.subviews(
            mainView.subviews(
                mainVericalStackView
            )
        )
        
        // layout
        mainView.fillContainer()
        mainVericalStackView.top(150)
        mainVericalStackView.bottom(70)
        mainVericalStackView.fillHorizontally(padding: 10)
        
    }


    @objc private func didTapToInstructionButton(_ sender: Any) {
        didSendEventClosure?(.latte)
    }
}

extension LatteViewController {
    enum Event {
        case latte
    }
}
