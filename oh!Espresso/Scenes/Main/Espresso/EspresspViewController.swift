//
//  EspressoViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 07.03.2023.
//

import UIKit

class EspressoViewController: UIViewController {

    // MARK: - Input
    private let ui = EspressoView()

    
    // MARK: - Output
    var didSendEventClosure: ((EspressoViewController.Event) -> Void)?

    
    
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

    private let coffeValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 13)
        label.text = "Обьем молотого кофе"
        label.width(150)
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()

    private let coffeValueTF: UITextField = {
        let textField = UITextField()
        textField.placeholder("18")
        textField.textAlignment = .center
        textField.backgroundColor = .systemBlue
        textField.width(150)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()

    private let brewRatioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title1", size: 13)
        label.text = "Коэфициент"
        label.width(150)
        label.height(30)
        label.layer.cornerRadius = 10
        return label
    }()

    private let brewRatioTF: UITextField = {
        let textField = UITextField()
        textField.placeholder("2.0")
        textField.textAlignment = .center
        textField.backgroundColor = .systemBlue
        textField.width(150)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()

    private let calcButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.width(120)
        button.height(35)
        button.addTarget(EspressoViewController.self, action: #selector(didTapCalcButton(_:)), for: .touchUpInside)
        return button
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title", size: 13)
        label.textAlignment = .center
        label.text = "0"
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

    private let coffeHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

    private let brewRatioHorizontalStackView: UIStackView = {
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
        coffeHorizontalStackView.backgroundColor = .systemGray5
        resultVerticalStackView.backgroundColor = .systemGray5
        brewRatioHorizontalStackView.backgroundColor = .systemGray5

        
        // Subviews
        mainVericalStackView.addArrangedSubview(coffeHorizontalStackView)
        coffeHorizontalStackView.addArrangedSubview(coffeValueLabel)
        coffeHorizontalStackView.addArrangedSubview(coffeValueTF)
        
        mainVericalStackView.addArrangedSubview(brewRatioHorizontalStackView)
        brewRatioHorizontalStackView.addArrangedSubview(brewRatioLabel)
        brewRatioHorizontalStackView.addArrangedSubview(brewRatioTF)
        
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

    @objc private func didTapCalcButton(_ sender: Any) {
        didSendEventClosure?(.espresso)
    }
}

extension EspressoViewController {
    enum Event {
        case espresso
    }
}

