//
//  CellModel.swift
//  CRE
//
//  Created by Adam Balzan on 13/9/21.
//  Copyright © 2021 Fairfax Digital. All rights reserved.
//

import UIKit

protocol TappableCell {
    var action: () -> Void { get }
}

class CellModel: CustomDebugStringConvertible {
    let identifier: String
    var backgroundColour: UIColor
    
    init(identifier: String, backgroundColour: UIColor = .white) {
        self.identifier = identifier
        self.backgroundColour = backgroundColour
    }
    
    var debugDescription: String {
        return String(reflecting: type(of: self))
    }
}

protocol Registrable {
    static var identifier: String { get }
    static var nibName: String { get }
}

protocol Prefetchable {
    var fetachableImageURLs: [URL] { get }
}

protocol Displayable {
    func willDisplayCell()
}

class ModeledCell: UITableViewCell {
    func setupCell(model: CellModel) {
        contentView.backgroundColor = model.backgroundColour
        selectionStyle = .none
    }
}


struct VPadding {
    let top: CGFloat
    let bottom: CGFloat
    
    init(top: CGFloat = 8, bottom: CGFloat = 8) {
        self.top = top
        self.bottom = bottom
    }
    
    init(both: CGFloat) {
        self.top = both
        self.bottom = both
    }
}



class SizeStackableCell: ModeledCell {
    func stackViewAxis(size: UIContentSizeCategory) ->  NSLayoutConstraint.Axis {
        if traitCollection.horizontalSizeClass == .compact {
            return [.extraExtraLarge, .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge].contains(size) ? .vertical : .horizontal
        }
        return .horizontal
    }
}
