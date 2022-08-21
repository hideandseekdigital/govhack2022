//
//  AttributedStringCell.swift
//
//  Created by Adam Balzan on 26/11/19.
//

import UIKit


class AttributedStringCell: ModeledCell, Registrable {

    class Model: CellModel, TappableCell {
        let attributedString: NSAttributedString
        let topPadding: CGFloat
        let bottomPadding: CGFloat
        let numberOfLines: Int
        let action: () -> Void
        
        init(attributedString: NSAttributedString, numberOfLines: Int = 0, backgroundColour: UIColor = .white, topPadding: CGFloat = 8, bottomPadding: CGFloat = 8,  action: @escaping () -> Void = {} ) {
            self.attributedString = attributedString
            self.topPadding = topPadding
            self.bottomPadding = bottomPadding
            self.action = action
            self.numberOfLines = 0
            super.init(identifier: AttributedStringCell.identifier)
        }
        
        init(title: String,  numberOfLines: Int = 0, font: UIFont = AppStyling.primaryFontOfSize(16), colour: UIColor = .notBlack, lineHeightMultiple: CGFloat = 1.09,  backgroundColour: UIColor = .white, topPadding: CGFloat = 8, bottomPadding: CGFloat = 8, action: @escaping () -> Void = {}) {
            self.attributedString = AppStyling.attributed(string: title, font: font, colour: colour, lineHeightMultiple: lineHeightMultiple)
            self.topPadding = topPadding
            self.bottomPadding = bottomPadding
            self.action = action
            self.numberOfLines = numberOfLines
            super.init(identifier: AttributedStringCell.identifier, backgroundColour: backgroundColour)
        }
    }
    
    static let identifier = "attributedStringCell"
    static let nibName = "AttributedStringCell"

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    override func setupCell(model: CellModel) {
        super.setupCell(model: model)
        guard let model = model as? AttributedStringCell.Model else { return }
        label.attributedText = model.attributedString
        label.numberOfLines = 0
        if model.numberOfLines > 0 {
            label.numberOfLines = model.numberOfLines
        }
        topConstraint.constant = model.topPadding
        bottomConstraint.constant = model.bottomPadding
        contentView.backgroundColor = model.backgroundColour
        setNeedsLayout()
    }
}

 
