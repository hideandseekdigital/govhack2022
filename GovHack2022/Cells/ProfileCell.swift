//
//  ProfileCell.swift
//  GovHack2022
//
//  Created by Adam Balzan on 21/8/2022.
//

import UIKit

class ProfileCell: ModeledCell {
    
    class Model: CellModel {
        let title: String
        let subTitle: String
        let imageName: String
        let rank: String
    

        init(title: String, subTitle: String, imageName: String, rank: String) {
            self.title = title
            self.subTitle = subTitle
            self.imageName = imageName
            self.rank = rank
            super.init(identifier: ProfileCell.identifier)
        }
    }
     
    static let identifier = "profileCell"
    static let nibName = "ProfileCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var rankLabel: PaddedLabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func setupCell(model: CellModel) {
        super.setupCell(model: model)
        guard let model = model as? ProfileCell.Model else { return }
        self.nameLabel.text = model.title
        self.pointsLabel.text = model.subTitle
        self.rankLabel.text = model.rank
        self.profileImageView.image = UIImage(named:  model.imageName)
    
    }
}
