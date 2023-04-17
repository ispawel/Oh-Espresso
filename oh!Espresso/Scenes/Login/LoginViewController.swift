//
//  LoginViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 17.04.2023.
//

import UIKit
import Stevia

class LoginViewController: UIViewController {

    var didSendEventClosure: ((LoginViewController.Event) -> Void)?

    //MARK: -
    
    private let loginTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemBlue
        textField.width(200)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let passwordTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemBlue
        textField.width(200)
        textField.height(30)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.width(200)
        button.height(35)
        return button
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
        loginTF.backgroundColor = UIColor(red:115/255.0, green:117/255.0, blue:117/255.0, alpha:1.0)
        passwordTF.backgroundColor = UIColor(red:115/255.0, green:117/255.0, blue:117/255.0, alpha:1.0)
        loginButton.backgroundColor = UIColor(red:115/255.0, green:117/255.0, blue:117/255.0, alpha:0.8)
        
        // Subviews
        view.subviews(vStackView)
        vStackView.addArrangedSubview(loginTF)
        vStackView.addArrangedSubview(passwordTF)
        vStackView.addArrangedSubview(loginButton)

        // layout
        vStackView.fillVertically(padding: 360)
        vStackView.fillHorizontally(padding: 100)
        
        
        
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }
    
//    deinit {
//        print("LoginViewController deinit")
//    }

    @objc private func didTapLoginButton(_ sender: Any) {
        didSendEventClosure?(.login)
    }
}

extension LoginViewController {
    enum Event {
        case login
    }
}
