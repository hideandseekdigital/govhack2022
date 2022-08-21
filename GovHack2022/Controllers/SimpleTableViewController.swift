//
//  SimpleTableViewController.swift
//  CRE
//
//  Created by Adam Balzan on 13/9/21.
//  Copyright © 2021 Fairfax Digital. All rights reserved.
//

import UIKit

class SimpleTableViewController: UITableViewController {

    var overlayView: UIView?
    var tableHelper: SimpleSection?
    private let progressView = UIProgressView(progressViewStyle: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableHelper = SimpleSection(tableView: tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.prefetchDataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.alwaysBounceVertical = false
    }
  
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let displayableCell = cell as? Displayable {
            displayableCell.willDisplayCell()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableHelper?.models.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = tableHelper?.models[indexPath.row] else { return UITableViewCell() }
        guard let helper = tableHelper else { return UITableViewCell() }
        return helper.cellFor(model: model) ?? helper.fallbackCell(indexPath: indexPath, model: model)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let model = tableHelper?.models[indexPath.row] as? TappableCell {
            model.action()
        }
    }

    
    func addOverlay() {
        if self.overlayView != nil {
            removeOverlay()
        }
        
        guard let currentWindow = UIApplication.shared.windows.first(where: \.isKeyWindow) else { return }
        let overlay = UIView(frame: currentWindow.bounds)
        overlay.backgroundColor = UIColor.notBlack.withAlphaComponent(0.4)
        currentWindow.addSubview(overlay)
        overlayView = overlay

    }

    func removeOverlay() {
        if let overlay = overlayView {
            overlay.removeFromSuperview()
            overlayView = nil
        }
    }
}
