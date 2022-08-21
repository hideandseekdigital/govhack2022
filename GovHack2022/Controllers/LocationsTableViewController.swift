//
//  LocationsTableViewController.swift
//  GovHack2022
//
//  Created by Adam Balzan on 21/8/2022.
//

import UIKit

class LocationsTableViewController: SimpleTableViewController {

    
    
    static func controller(selectedLocation: String, closeAction: @escaping () -> Void ) -> LocationsTableViewController {
        let controller = LocationsTableViewController()
        controller.loadViewIfNeeded()
        controller.hidesBottomBarWhenPushed = true
        controller.closeAction = closeAction
        controller.setupView(selectedLocation: selectedLocation)
        return controller
    }

    
    var closeAction: (() -> Void)?
    
    private func setupView(selectedLocation: String) {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(closeButtonTouched))
        self.navigationItem.rightBarButtonItem?.tintColor = .notBlack

        self.navigationItem.title = "Locations"
        
        
        
        tableHelper?.models.append(TwoColumnCell.Model(string1: AppStyling.attributed(string: "Adelaide", colour: .notBlack), string2: AppStyling.attributed(string: ""), string2Width: 30, imageName: "", imageColour: .notBlack, padding: VPadding(both: 8), action: closeButtonTouched))
        tableHelper?.models.append(TwoColumnCell.Model(string1: AppStyling.attributed(string: "Brisbane", colour: .notBlack), string2: AppStyling.attributed(string: ""), string2Width: 30, imageName: "", imageColour: .notBlack, padding: VPadding(both: 8), action: closeButtonTouched))
        tableHelper?.models.append(TwoColumnCell.Model(string1: AppStyling.attributed(string: "Canberra", colour: .notBlack), string2: AppStyling.attributed(string: ""), string2Width: 30, imageName: "Tick", imageColour: .notBlack, padding: VPadding(both: 8), action: closeButtonTouched))
        tableHelper?.models.append(TwoColumnCell.Model(string1: AppStyling.attributed(string: "Darwin", colour: .notBlack), string2: AppStyling.attributed(string: ""), string2Width: 30, imageName: "", imageColour: .notBlack, padding: VPadding(both: 8), action: closeButtonTouched))
        
    }
    
    @objc func closeButtonTouched() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        if let action = closeAction {
            action()
        }
        
    }
    
}
