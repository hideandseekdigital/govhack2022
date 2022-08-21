//
//  TwoColumnCell.swift
//
//  Created by Adam Balzan on 1/3/21.
//

import UIKit

class TwoColumnCell: SizeStackableCell, Registrable {

    class Model: CellModel, TappableCell {
        let string1: NSAttributedString
        let string2: NSAttributedString
        let string2Width: CGFloat?
        let imageName: String?
        let imageColour: UIColor?
        let padding: VPadding
        let action: () -> Void
        

        init(string1: NSAttributedString, string2: NSAttributedString, string2Width: CGFloat? = nil, imageName: String? = nil, imageColour: UIColor? = nil, padding: VPadding = VPadding(top: 4, bottom: 4), action: @escaping () -> Void = {}) {
            self.string1 = string1
            self.string2 = string2
            self.action = action
            self.string2Width = string2Width
            self.imageName = imageName
            self.imageColour = imageColour
            self.padding = padding
            super.init(identifier: TwoColumnCell.identifier)
        }
    }

    static let identifier = "twoColumnCell"
    static let nibName = "TwoColumnCell"

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label2Width: NSLayoutConstraint!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    override func setupCell(model: CellModel) {
        super.setupCell(model: model)
        guard let model = model as? TwoColumnCell.Model else { return }

        stackView.axis = .horizontal // stackViewAxis(size: model.contentSizeCategoryOverride)
        stackView.spacing = stackView.axis == .vertical ? 0 : 8

        self.label1.attributedText = model.string1
        self.label2.attributedText = model.string2
        self.label2Width.isActive = false
        if let width = model.string2Width {
            self.label2Width.isActive = true
            self.label2Width.constant = width
        }

        rightImageView.image = nil
        self.rightImageView.isHidden = true
        if let name = model.imageName {
            self.rightImageView.isHidden = false // have imageName show image view even if there is no image to show, For layout reasons
            if let image = UIImage(named: name) {
                rightImageView.image = image
            }
        }
        topConstraint.constant =  model.padding.top
        bottomConstraint.constant = model.padding.bottom
        setNeedsLayout()
    }
}
