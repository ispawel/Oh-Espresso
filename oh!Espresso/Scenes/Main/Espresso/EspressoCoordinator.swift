//
//  StartCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 12.04.2023.
//


import Foundation
import UIKit

protocol EspressoCoordinatorProtocol: Coordinator {
    func showEspressoViewController()
}

class EspressoCoordinator: EspressoCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .listCoffe }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showEspressoViewController()
    }
    
    func showEspressoViewController() {
        let espressoVC: EspressoViewController = .init()
        espressoVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        navigationController.pushViewController(espressoVC, animated: true)
    }
}

