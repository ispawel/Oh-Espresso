//
//  InstructionCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 12.04.2023.
//

import Foundation
import UIKit

protocol InstructionCoordinatorProtocol: Coordinator {
    func showInstructionViewController()
}

class InstructionCoordinator: InstructionCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .login }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showInstructionViewController()
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func showInstructionViewController() {
        let instructionVC: LoginViewController = .init()
        instructionVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        
        navigationController.pushViewController(instructionVC, animated: true)
    }
}

