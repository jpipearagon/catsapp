//
//  CatsIcons.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Foundation
import UIKit

struct CatsIcons {
    var backImage: UIImage {
        return UIImage(named: "back") ?? UIImage()
    }
    var badImage: UIImage {
        return UIImage(named: "bad") ?? UIImage()
    }
}
