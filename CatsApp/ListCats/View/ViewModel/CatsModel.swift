//
//  CatsModel.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Foundation
import RxSwift

struct CatsModel {
    let catsSubject = PublishSubject<[Cat]>()
}
