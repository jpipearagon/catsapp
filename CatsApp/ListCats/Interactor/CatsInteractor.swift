//
//  CatsInteractor.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Foundation
import RxSwift

protocol CatInteractorOutputProtocol { }

final class CatsInteractor: CatsViewControllerOutputProtocol {
    private let presenter: CatInteractorOutputProtocol?
    private let dataManager: CatsDataManagerProtocol?

    init(presenter: CatInteractorOutputProtocol, dataManager: CatsDataManagerProtocol? = nil) {
        self.presenter = presenter
        self.dataManager = dataManager ?? CatsDataManager()
    }
    
    func getCats() -> Observable<[Cat]> {
        return dataManager?.getCats().asObservable() ?? .just([])
    }
}
