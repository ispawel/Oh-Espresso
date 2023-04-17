//
//  StartPageViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 07.03.2023.
//

import UIKit

class StartViewController: UIViewController {

    var didSendEventClosure: ((StartViewController.Event) -> Void)?

    private let enterValueButton: UIButton = {
        let button = UIButton()
        button.setTitle("To enter Value", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(enterValueButton)

        enterValueButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            enterValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterValueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            enterValueButton.widthAnchor.constraint(equalToConstant: 200),
            enterValueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        enterValueButton.addTarget(self, action: #selector(didTapToEnterValueButton(_:)), for: .touchUpInside)
    }
    
    deinit {
        print("StartViewController deinit")
    }

    @objc private func didTapToEnterValueButton(_ sender: Any) {
        didSendEventClosure?(.start)
    }
}

extension StartViewController {
    enum Event {
        case start
    }
}
