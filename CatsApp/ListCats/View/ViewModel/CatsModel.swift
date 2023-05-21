//
//  SearchModel.swift
//  BoldTest
//
//  Created by Felipe Aragon on 24/03/23.
//

import Foundation
import RxSwift

struct CatsModel {
    let catsSubject = PublishSubject<[Cat]>()
}
