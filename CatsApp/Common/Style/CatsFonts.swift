//
//  CatsFonts.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Foundation
import UIKit

enum CatsFontBase: CGFloat {
    case smallOne = 13
    case smallTwo = 15
    case smallThree = 17
    case head = 34
}

enum CatsFontName: String {
    case avenirNormal = "Avenir"
    case avenirHeavy = "Avenir-Heavy"
    case avenirBlack = "Avenir-Black"
}

struct CatsFonts {
    var avenirHeavySmallTwo: UIFont {
        return UIFont.font(.avenirHeavy, size: .smallTwo)
    }
    
    var avenirNormalSmallOne: UIFont {
        return UIFont.font(.avenirNormal, size: .smallOne)
    }
    
    var avenirNormalSmallThree: UIFont {
        return UIFont.font(.avenirNormal, size: .smallThree)
    }
    
    var avenirBlackHead: UIFont {
        return UIFont.font(.avenirBlack, size: .head)
    }
}
