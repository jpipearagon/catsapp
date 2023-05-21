//
//  SearchPresenter.swift
//  BoldTest
//
//  Created by Felipe Aragon on 23/03/23.
//

import Foundation
import RxSwift

protocol CatsPresenterOutputProtocol: AnyObject { }

final class CatsPresenter: CatInteractorOutputProtocol {
    private weak var viewController: CatsPresenterOutputProtocol?
    private let disposeBag = DisposeBag()
    
    init(viewController: CatsPresenterOutputProtocol) {
        self.viewController = viewController
    }
}
