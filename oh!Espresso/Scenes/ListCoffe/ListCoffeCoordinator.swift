//
//  ListCoffeCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 15.04.2023.
//

import Foundation
import UIKit

protocol ListCoffeCoordinatorProtocol: Coordinator {
    func showListCoffeViewController()
}

class ListCoffeCoordinator: ListCoffeCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .listCoffe }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showListCoffeViewController()
    }
    
    deinit {
        print("ListCoffe Coordinator deinit")
    }
    
    func showListCoffeViewController() {
        let listCoffeVC: ListCoffeViewController = .init()
        listCoffeVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        navigationController.pushViewController(listCoffeVC, animated: true)
    }
}
