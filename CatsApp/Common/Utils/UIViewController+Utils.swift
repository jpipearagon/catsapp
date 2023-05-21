//
//  UIViewController+Utils.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import UIKit

extension UIViewController {
    func addDefaultBack() {
        let button = UIButton(type: .system)
        button.setImage(CatsTestStyle.icon.backImage, for: .normal)
        button.tintColor = CatsTestStyle.color.accentColor
        button.addTarget(self, action: #selector(popToPrevious), for: .touchUpInside)
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: button), animated: true)
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}
