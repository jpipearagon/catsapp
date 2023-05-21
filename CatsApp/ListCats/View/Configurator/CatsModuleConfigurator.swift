//
//  CatsModuleConfigurator.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Foundation

final class CatsModuleConfigurator {
    
    // MARK: Configuration
    class func view() -> CatsViewController {
        let viewController = CatsViewController()
        let presenter = CatsPresenter(viewController: viewController)
        let interactor = CatsInteractor(presenter: presenter)
        let router = CatsRouter(viewController: viewController)
        viewController.setViewOutput(outPut: interactor, router: router)
        return viewController
    }
}
