//
//  EnterValueCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 12.04.2023.
//


import Foundation
import UIKit

protocol EnterValueCoordinatorProtocol: Coordinator {
    func showEnterValueViewController()
}

class EnterValueCoordinator: EnterValueCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .login }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showEnterValueViewController()
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func showEnterValueViewController() {
        let enterValueVC: EnterValueViewController = .init()
        enterValueVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        navigationController.pushViewController(enterValueVC, animated: true)
    }
}
