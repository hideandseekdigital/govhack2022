//
//  FaunaCalloutView.swift
//  GovHack2022
//
//  Created by Adam Balzan on 20/8/2022.
//

import UIKit

class FaunaCalloutView: BorderdView {

    @IBOutlet var typeLabel: PaddedLabel?
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var lastSeenLabel: UILabel?
    @IBOutlet var coordLabel: UILabel?
    var action: ()->Void = {}
    
    func setupView(faunaHabitat: FaunaHabitat, action: @escaping ()-> Void) {
        typeLabel?.text = faunaHabitat.data.type
        typeLabel?.backgroundColor = faunaHabitat.data.colour
        
        imageView?.image = UIImage(named: faunaHabitat.data.imageName)
        nameLabel?.text = faunaHabitat.data.name
        lastSeenLabel?.text = faunaHabitat.data.lastSeen
        coordLabel?.text = "Location coordinates"
        self.action = action
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        action()
    }
    
}
