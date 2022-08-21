//
//  InfoTableViewController.swift
//  GovHack2022
//
//  Created by Adam Balzan on 20/8/2022.
//

import UIKit

 
class InfoTableViewController: SimpleTableViewController {

    static func controller(fauna: FaunaHabitat) -> InfoTableViewController {
        let controller = InfoTableViewController()
        controller.loadViewIfNeeded()
        controller.hidesBottomBarWhenPushed = true
        controller.setupView(fauna: fauna)
        return controller
    }
    
    
    
    
    private func setupView(fauna: FaunaHabitat) {
        tableHelper?.append(ImageCell.Model(imageName: fauna.data.headerImageName, height: 310 , tint: nil)) //286
        tableHelper?.append(PaddingCell.Model(height: 16))
        

        let title = AppStyling.attributed(string:  fauna.nameCommon, font: AppStyling.primaryFontOfSize(18), alignment: .center)
        tableHelper?.append(AttributedStringCell.Model(attributedString: title))
        
        let speacies = AppStyling.attributed(string:  fauna.category,font: AppStyling.primarySemiboldFontOfSize(14),  alignment: .center)
        tableHelper?.append(AttributedStringCell.Model(attributedString: speacies))

        
        let raraity = AppStyling.attributed(string:  fauna.data.type, font: AppStyling.primaryFontOfSize(14),  alignment: .center)
        tableHelper?.append(AttributedStringCell.Model(attributedString: raraity))


        tableHelper?.append(ImageCell.Model(imageName: fauna.data.heroImageName, height: 224, tint: nil))
        
        tableHelper?.append(TwoColumnCell.Model(string1: AppStyling.attributed(string: "Location:"), string2: AppStyling.attributed(string: fauna.location),string2Width: 250 , padding: VPadding(top: 24, bottom: 4)))
        tableHelper?.append(TwoColumnCell.Model(string1: AppStyling.attributed(string: "Type:"), string2: AppStyling.attributed(string: fauna.type) ,string2Width: 250,  padding: VPadding(top: 4, bottom: 4)))

        tableHelper?.append(TwoColumnCell.Model(string1: AppStyling.attributed(string: "Status:"), string2: AppStyling.attributed(string: fauna.statusACT),string2Width: 250, padding: VPadding(top: 4, bottom: 24)))

        tableHelper?.append(AttributedStringCell.Model(attributedString: AppStyling.attributed(string: fauna.data.description),  topPadding: 24, bottomPadding: 24, action: {}))
        
    }
}
