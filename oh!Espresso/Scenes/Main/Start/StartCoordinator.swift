//
//  StartCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 12.04.2023.
//


import Foundation
import UIKit

protocol StartCoordinatorProtocol: Coordinator {
    func showStartViewController()
}

class StartCoordinator: StartCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .login }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showStartViewController()
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func showStartViewController() {
        let startVC: StartViewController = .init()
        startVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        navigationController.pushViewController(startVC, animated: true)
    }
}

