//
//  MyCollectionGenericWebViewController.swift
//  GovHack2022
//
//  Created by Adam Balzan on 21/8/2022.
//

import UIKit
import WebKit

class MyCollectionGenericWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.load(URLRequest(url: URL(string: "https://bindiigovhack.netlify.app/collections")!))
    }
    
    
}
