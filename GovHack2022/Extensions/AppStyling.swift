//
//  AppStyling.swift
//  CRE
//
//  Created by Adam Balzan on 13/9/21.
//  Copyright © 2021 Fairfax Digital. All rights reserved.
//

import UIKit

class AppStyling: NSObject {

    static let defaultFontSize = CGFloat(16.0)
    static let primaryFontName = "SourceSansPro-Regular"
    static let primarySemiboldFontName = "SourceSansPro-Semibold"
    static let defaultColour = UIColor.notBlack
    static let defaultLineMultiplier = CGFloat(1.09)
    
    static func primaryFontOfSize(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: primaryFontName, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    static func primarySemiboldFontOfSize(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: primarySemiboldFontName, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
  
    
    static func attributed(string: String,
                           font: UIFont = AppStyling.primaryFontOfSize(defaultFontSize),
                           colour: UIColor = defaultColour ,
                           boldStrings: [String] = [],
                           boldFont: UIFont = AppStyling.primarySemiboldFontOfSize(defaultFontSize),
                           boldColour: UIColor = defaultColour,
                           underlinedStrings: [String] = [],
                           underlinedTextColour: UIColor = defaultColour ,
                           underlinedColour: UIColor = defaultColour,
                           underlinedStyle: NSUnderlineStyle = .single,
                           lineHeightMultiple: CGFloat = defaultLineMultiplier,
                           alignment: NSTextAlignment = .left
    ) -> NSAttributedString {
        
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = lineHeightMultiple
        style.alignment = alignment
        
        let attributedString = NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: colour, NSAttributedString.Key.paragraphStyle: style])
        
        underlinedStrings.forEach { (boldString) in
            let range = attributedString.mutableString.range(of: boldString)
            attributedString.addAttributes( [.underlineStyle: underlinedStyle.rawValue, .underlineColor: underlinedColour, NSAttributedString.Key.foregroundColor: underlinedTextColour], range: range)
        }

        boldStrings.forEach { (boldString) in
            let range = attributedString.mutableString.range(of: boldString)
            attributedString.addAttributes( [NSAttributedString.Key.font: boldFont, NSAttributedString.Key.foregroundColor: boldColour], range: range)
        }
        
        return attributedString
    }
    
}
