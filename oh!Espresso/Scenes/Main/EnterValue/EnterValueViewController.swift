//
//  EnterValueViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 10.04.2023.
//

import UIKit

class EnterValueViewController: UIViewController {

    var didSendEventClosure: ((EnterValueViewController.Event) -> Void)?

    private let toInstructionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(toInstructionButton)

        toInstructionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            toInstructionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toInstructionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            toInstructionButton.widthAnchor.constraint(equalToConstant: 200),
            toInstructionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        toInstructionButton.addTarget(self, action: #selector(didTapToInstructionButton(_:)), for: .touchUpInside)
    }
    
    deinit {
        print("LoginViewController deinit")
    }

    @objc private func didTapToInstructionButton(_ sender: Any) {
        didSendEventClosure?(.enterValue)
    }
}

extension EnterValueViewController {
    enum Event {
        case enterValue
    }
}
