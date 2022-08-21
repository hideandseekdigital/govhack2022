//
//  BorderdView.swift

//
//  Created by Adam Balzan on 13/5/19.
//

import UIKit

@IBDesignable
class BorderdView: UIView {

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    //Normal state bg and border
    @IBInspectable var normalBorderColor: UIColor? {
        didSet {
            layer.borderColor = normalBorderColor?.cgColor
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        clipsToBounds = true

        if borderWidth > 0 {
            layer.borderColor = normalBorderColor?.cgColor
        }
    }

    @objc func dropShadow() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 6
        layer.masksToBounds = false
    }

}
