//
//  RafCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 12.04.2023.
//

import Foundation
import UIKit

protocol RafCoordinatorProtocol: Coordinator {
    func showRafViewController()
}

class RafCoordinator: RafCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .login }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showRafViewController()
    }
    
    deinit {
        print("RafCoordinator deinit")
    }
    
    func showRafViewController() {
        let rafVC: RafViewController = .init()
        rafVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        
        navigationController.pushViewController(rafVC, animated: true)
    }
}

