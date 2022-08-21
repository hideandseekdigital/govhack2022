//
//  LeaderboardTableViewController.swift
//  GovHack2022
//
//  Created by Adam Balzan on 20/8/2022.
//

import UIKit

struct Player {
    let name: String
    let rank: Int
    let subtitle: String
    let image: String
}


class LeaderboardTableViewController: SimpleTableViewController {

    var smallTransitioningManager: SmallPresentationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupView()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        removeOverlay()
    }
    
    func setupView() {

        let players = [Player(name: "Adam Balzan", rank: 4, subtitle: "1,909PTS • 9 badges", image: "Profile1"),
                       Player(name: "Adriaan Steyn", rank: 5, subtitle: "1,705PTS • 8 badges", image: "Profile2"),
                       Player(name: "Alex Metcalfe", rank: 6, subtitle: "1,665PTS • 7 badges", image: "Profile3"),
                       Player(name: "Dan Navfield", rank: 7, subtitle: "1,567PTS • 6 badges", image: "Profile4"),
                       Player(name: "Mel Stubbings", rank: 8, subtitle: "1,437PTS • 5 badges", image: "Profile5"),
                       Player(name: "Lauren Nichol", rank: 9, subtitle: "1,334PTS • 5 badges", image: "Profile6"),
                       Player(name: "Onur", rank: 10, subtitle: "1,319PTS • 5 badges", image: "Profile1"),
                       Player(name: "Shawn Dong", rank: 11, subtitle: "1,299PTS • 4 badges", image: "Profile2"),
                       Player(name: "Tully Lampasona", rank: 12, subtitle: "1,275PTS • 4 badges", image: "Profile3"),
                       Player(name: "Vilka Kolak", rank: 13, subtitle: "1,240PTS • 3 badges", image: "Profile4"),
                       Player(name: "Patrick Morgan", rank: 14, subtitle: "1,100PTS • 3 badges", image: "Profile5"),
                       Player(name: "Junayed Hossain", rank: 15, subtitle: "1,003PTS • 3 badges", image: "Profile6"),
                       Player(name: "Kamilla Akhmedova", rank: 16, subtitle: "709PTS • 3 badges", image: "Profile1")
        ]

        tableHelper?.append(ImageCell.Model(imageName: "Rankings", height: 390, tint: nil))
        
        players.forEach { player in
            tableHelper?.append(ProfileCell.Model(title: player.name , subTitle: player.subtitle , imageName: player.image, rank: "\(player.rank)"))
        }
        
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 120, height: 30))
        label.text = "Rankings"
        label.font = UIFont(name: "Futura-Bold", size: 24)
        label.textColor = .notBlack
        tableView.addSubview(label)
        
        let locationView = BorderdView(frame: CGRect(x: 220, y: 17, width: 160, height: 40))
        locationView.borderWidth = 1
        locationView.normalBorderColor = .notBlack
        locationView.cornerRadius = 20
        locationView.backgroundColor = .white
        
        let canberraLabel = UILabel(frame: CGRect(x: 16, y: 8, width: 120, height: 24))
        canberraLabel.text = "Canberra"
        canberraLabel.font = AppStyling.primaryFontOfSize(16)
        canberraLabel.textColor = .notBlack
        locationView.addSubview(canberraLabel)
        
        let icon = UIImageView(frame: CGRect(x: 124, y: 17, width: 10, height: 6))
        icon.image = UIImage(systemName: "chevron.down")
        icon.tintColor = .notBlack
        locationView.addSubview(icon)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(locationTapped))
        tapGesture.numberOfTapsRequired = 1
        locationView.addGestureRecognizer(  tapGesture)
        tableView.addSubview(locationView)
        
    }
    
    @objc func locationTapped() {
        addOverlay()
        
        let navController = UINavigationController(rootViewController: LocationsTableViewController.controller(selectedLocation: "Canberra", closeAction: { [weak self] in
            self?.removeOverlay()
        }))
        self.smallTransitioningManager = SmallPresentationController(presentedViewController: navController, presenting: self)
        self.smallTransitioningManager?.defaultHeight = CGFloat(300)
        navController.transitioningDelegate = self.smallTransitioningManager
        navController.modalPresentationStyle = .custom
        
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: .main)
        guard let profile = storyBoard.instantiateViewController(withIdentifier: "ProfileTableViewController") as? ProfileTableViewController else { return  }
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.pushViewController(  profile, animated: true)
    }
}
