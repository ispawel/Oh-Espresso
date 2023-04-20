//
//  LatteCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 12.04.2023.
//


import Foundation
import UIKit

protocol LatteCoordinatorProtocol: Coordinator {
    func showLatteViewController()
}

class LatteCoordinator: LatteCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .listCoffe }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showLatteViewController()
    }
    
    func showLatteViewController() {
        let latteVC: LatteViewController = .init()
        latteVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        navigationController.pushViewController(latteVC, animated: true)
    }
}
