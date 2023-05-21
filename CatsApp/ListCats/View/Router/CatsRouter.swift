//
//  CatsRouter.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import UIKit

protocol CatsRouterProtocol {
    func goToDetail(cat: Cat)
}

final class CatsRouter: CatsRouterProtocol {
    private weak var viewController: UIViewController?
    private var navigation: UINavigationController? {
        if let presentNavigation = viewController?.navigationController {
            return presentNavigation
        }
        return nil
    }
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func goToDetail(cat: Cat) {
        guard let navigation = navigation else {
            return
        }
        //let viewcontroller = DetailModuleConfigurator.view(cat: cat)
        //navigation.pushViewController(viewcontroller, animated: true)
    }
}
