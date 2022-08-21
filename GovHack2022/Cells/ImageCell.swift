//
//  ImageCell.swift
//
//  Created by Adam Balzan on 14/9/21.
//

import UIKit

class ImageCell: ModeledCell, Registrable {

    class Model: CellModel {
        let imageName: String
        let height: CGFloat
        let tint: UIColor?

        init(imageName: String, height: CGFloat, tint: UIColor? = nil) {
            self.imageName = imageName
            self.height = height
            self.tint = tint
            super.init(identifier: ImageCell.identifier)
        }
    }

    static let identifier = "imageCell"
    static let nibName = "ImageCell"

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellImageView: UIImageView!

    override func setupCell(model: CellModel) {
        super.setupCell(model: model)
        guard let model = model as? ImageCell.Model else { return }
        selectionStyle = .none

        if let tint = model.tint {
            cellImageView.image = UIImage(named: model.imageName)
            cellImageView.image = cellImageView.image?.withRenderingMode(.alwaysTemplate)
            cellImageView.tintColor = tint
        } else {
            cellImageView.image = UIImage(named: model.imageName)
        }
        heightConstraint.constant = model.height
        setNeedsLayout()
    }
}
