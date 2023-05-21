//
//  CatsDataManager.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Foundation
import RxSwift
import Moya

protocol CatsDataManagerProtocol {
    func getCats() -> Single<[Cat]>
}

final class CatsDataManager: BaseDataManager, CatsDataManagerProtocol {
    
    init(provider: MoyaProvider<CatsApi>? = nil) {
        super.init()
        self.provider = provider ?? MoyaProvider<CatsApi>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    }
    
    func getCats() -> Single<[Cat]> {
        return provider?.rx
            .request(.getCats)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([Cat].self) ?? .just([])
    }
}
