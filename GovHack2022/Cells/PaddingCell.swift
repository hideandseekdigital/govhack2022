//
//  PaddingCell.swift
//
//  Created by Adam Balzan on 26/3/20.
//

import UIKit

class PaddingCell: ModeledCell, Registrable {
    class Model: CellModel {
        let height: CGFloat
        
        init(height: CGFloat, backgroundColour: UIColor = .white) {
            self.height =  height
            super.init(identifier: PaddingCell.identifier, backgroundColour: backgroundColour)
        }
    }

    static let identifier = "paddingCell"
    static let nibName = "PaddingCell"

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func setupCell(model: CellModel) {
        super.setupCell(model: model)
        guard let model = model as? PaddingCell.Model else { return }
        self.heightConstraint.constant = model.height
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
}
