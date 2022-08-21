//
//  ProfileTableViewController.swift
//  GovHack2022
//
//  Created by Adam Balzan on 20/8/2022.
//

import UIKit
import WebKit
class ProfileTableViewController: UIViewController {

    
       @IBOutlet weak var webView: WKWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://bindiigovhack.netlify.app/profile")!))

    }

    // MARK: - Table view data source

     

}
