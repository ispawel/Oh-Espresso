//
//  AppCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 10.04.2023.
//

import UIKit

// Define what type of flows can be started from this Coordinator
protocol AppCoordinatorProtocol: Coordinator {
    func showListCoffeFlow()
    func showMainFlow()
}

// App coordinator is the only one coordinator which will exist during app's life cycle
class AppCoordinator: AppCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }

    func start() {
        showListCoffeFlow()
        //showMainFlow()
    }
        
    func showListCoffeFlow() {
        // Implementation of List Coffe FLow
        let listCoffeCoordinator = ListCoffeCoordinator.init(navigationController)
        listCoffeCoordinator.finishDelegate = self
        listCoffeCoordinator.start()
        childCoordinators.append(listCoffeCoordinator)
    }
    
    func showMainFlow() {
        // Implementation Main (Tab bar) FLow
        let tabCoordinator = TabCoordinator.init(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
    
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type {
            
        case .tab:
            navigationController.viewControllers.removeAll()
            showListCoffeFlow()
            
        case .listCoffe:
            navigationController.viewControllers.removeAll()
            showMainFlow()
            
        default:
            break
        }
    }
}
