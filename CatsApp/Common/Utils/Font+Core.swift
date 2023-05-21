//
//  Font+Core.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Foundation
import UIKit

extension UIFont {
    
    static func defaultFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    static func font(_ name: CatsFontName, size: CatsFontBase) -> UIFont {
        return UIFont(name: name.rawValue, size: size.rawValue) ?? defaultFont(size: size.rawValue)
    }
    
    static func font(_ font: CatsFontBase, style: CatsFontName) -> UIFont {
        return UIFont.font(font.rawValue, style: style.rawValue)
    }
    
    static func font(_ fontSize: CGFloat, style: String) -> UIFont {
        UIFont.register(font: style, withExtension: "ttf")
        
        let font = UIFont(name: style, size: fontSize)
        return font ?? UIFont.defaultFont(size: fontSize)
    }
    
    static func register(font named: String, withExtension extensionType: String) {
        let bundle = Bundle.main
        var error: Unmanaged<CFError>? = nil
        defer { error?.release() }
        guard let url = bundle.url(forResource: named, withExtension: extensionType),
            let provider = CGDataProvider(url: url as CFURL) else { return }
        
        if let font = CGFont(provider) {
            _ = CTFontManagerRegisterGraphicsFont(font, &error)
        }
    }
}
