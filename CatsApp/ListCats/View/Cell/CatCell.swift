//
//  LocationTableViewCell.swift
//  BoldTest
//
//  Created by Felipe Aragon on 24/03/23.
//

import Foundation
import UIKit
import Nuke

class CatCell: UITableViewCell {
    @IBOutlet private weak var breedNameLabel: UILabel!
    @IBOutlet private weak var originLabel: UILabel!
    @IBOutlet private weak var intelligenLabel: UILabel!
    @IBOutlet private weak var imageCat: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        breedNameLabel.font = CatsTestStyle.font.avenirBlackHead
        breedNameLabel.textColor = CatsTestStyle.color.accentColor
        originLabel.font = CatsTestStyle.font.avenirNormalSmallOne
        originLabel.textColor = CatsTestStyle.color.accentColor
        intelligenLabel.font = CatsTestStyle.font.avenirNormalSmallOne
        intelligenLabel.textColor = CatsTestStyle.color.accentColor
    }
    
    func setup(name: String, origin: String, intelligen: Int, imageUrl: String) {
        breedNameLabel.text = name
        originLabel.text = "Pais de origen: \(origin)"
        intelligenLabel.text = "Inteligencia: \(intelligen)"
        Nuke.loadImage(with: imageUrl, into: imageCat)
    }
}
