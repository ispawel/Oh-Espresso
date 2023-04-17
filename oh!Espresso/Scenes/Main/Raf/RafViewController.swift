//
//  RafViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 12.04.2023.
//

import UIKit

class RafViewController: UIViewController {

    var didSendEventClosure: ((RafViewController.Event) -> Void)?


    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


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
