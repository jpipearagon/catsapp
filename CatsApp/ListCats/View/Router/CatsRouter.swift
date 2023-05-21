//
//  SearchRouter.swift
//  BoldTest
//
//  Created by Felipe Aragon on 23/03/23.
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
        //let viewcontroller = DetailModuleConfigurator.view(locationName: location.name)
        //navigation.pushViewController(viewcontroller, animated: true)
    }
}
