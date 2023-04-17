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

    
    //MARK: -
    
    private let coffeTF: UITextField = {
        let textField = UITextField()
        textField.placeholder("Value coffe")
        textField.backgroundColor = .systemBlue
        textField.width(200)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let brewRatioSegment: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.backgroundColor = .systemBlue
        segmentedControl.width(300)
        segmentedControl.height(30)
        segmentedControl.layer.cornerRadius = 10
        return segmentedControl
    }()
    
    private let espressoValue: UILabel = {
        let label = UILabel()
        label.text = "qwe"
        label.backgroundColor = .systemBlue
        label.layer.cornerRadius = 10
        label.width(200)
        label.height(35)
        return label
    }()
    
    //MARK: - Containers
    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        view.backgroundColor = UIColor(red:22/255.0, green:62/255.0, blue:47/255.0, alpha:0.6)
        //vStackView.backgroundColor = UIColor(red:22/255.0, green:62/255.0, blue:47/255.0, alpha:1.0)
       // loginTF.backgroundColor = UIColor(red:115/255.0, green:117/255.0, blue:117/255.0, alpha:1.0)
       // passwordTF.backgroundColor = UIColor(red:115/255.0, green:117/255.0, blue:117/255.0, alpha:1.0)
       // loginButton.backgroundColor = UIColor(red:115/255.0, green:117/255.0, blue:117/255.0, alpha:0.8)
        
        // Subviews
        view.subviews(vStackView)
        //vStackView.addArrangedSubview(coffeTF)
        //vStackView.addArrangedSubview(passwordTF)
        //vStackView.addArrangedSubview(loginButton)

        // layout
        vStackView.fillVertically(padding: 360)
        vStackView.fillHorizontally(padding: 100)
        // toInstructionButton.addTarget(self, action: #selector(didTapToInstructionButton(_:)), for: .touchUpInside)
    }
    
    deinit {
        print("LatteViewController deinit")
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
