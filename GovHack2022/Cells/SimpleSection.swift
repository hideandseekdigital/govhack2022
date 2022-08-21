//
//  SimpleSection.swift
//  CRE
//
//  Created by Adam Balzan on 13/9/21.
//  Copyright © 2021 Fairfax Digital. All rights reserved.
//

import UIKit

class SimpleSection: NSObject {

    var models: [CellModel] = []
    let theTableView: UITableView
    var section = 0
    var headerModel: CellModel?
    
    
    func register(cells: [Registrable.Type]) {
        cells.forEach { (eachClass) in
            register(cell: eachClass)
        }
    }
    
    func register(cell: Registrable.Type) {
        theTableView.register(UINib(nibName: cell.nibName, bundle: .main), forCellReuseIdentifier: cell.identifier)
    }
    
    init(tableView: UITableView) {
        self.theTableView = tableView
        super.init()
        
    }
    
    func append(_ model: CellModel) {
        models.append(model)
    }
    
    func removeAll() {
        models.removeAll()
    }
    
    func appendPaddingCell(height: CGFloat) {
        models.append(PaddingCell.Model(height: height))
    }
    
    func appendMessageCell(title: String, font: UIFont = AppStyling.primaryFontOfSize(16), colour: UIColor = .notBlack) {
        models.append(AttributedStringCell.Model(attributedString: AppStyling.attributed(string: title, font: font, colour: colour)))
    }
    
   
    func cellFor(model: CellModel) -> UITableViewCell? {
        if let cell = self.theTableView.dequeueReusableCell(withIdentifier: model.identifier) as? ModeledCell {
            cell.setupCell(model: model)
            return cell
        }

        // attempt to add register the Cell Model based off the Identifier
        if Bundle.main.path(forResource: model.identifier.capitalizingFirstLetter(), ofType: "nib") != nil {
            theTableView.register(UINib(nibName: model.identifier.capitalizingFirstLetter(), bundle: .main), forCellReuseIdentifier: model.identifier)
            return cellFor(model: model)
        }

        return nil
    }
    
    func open(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension SimpleSection: UITableViewDataSource {
    
    @objc func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        if let cell = self.theTableView.dequeueReusableCell(withIdentifier: model.identifier) as? ModeledCell {
            cell.setupCell(model: model)
            return cell
        }
        
        #if DEBUG || ALPHA || BETA
        return cellFor(model: models[indexPath.row]) ?? fallbackCell(indexPath: indexPath, model: models[indexPath.row])
        #else
        return cellFor(model: models[indexPath.row]) ?? UITableViewCell()
        #endif
    }
    
    func fallbackCell(indexPath: IndexPath, model: CellModel) -> UITableViewCell {
        // fallback and display for coder
        let cell = UITableViewCell()
        cell.textLabel?.text = "ERROR: Missing cellForRowAt for \(String(describing: model) ) \nIdentifier:  \(model.identifier) \nindexPath: section\(indexPath.section) row\(indexPath.row) "
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = .red
        return cell
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    @objc func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let headerModel = headerModel {
            if let cell = cellFor(model: headerModel) {
                return cell.frame.size.height
            }
        }
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerModel = headerModel {
            guard let cell = cellFor(model: headerModel) else { return nil }
            if  headerModel as? TappableCell != nil {
                let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleHeaderTap(sender:)))
                cell.addGestureRecognizer(tapRecognizer)
            } else {
                cell.isUserInteractionEnabled = false
            }
            return cell
        }
        return nil
    }
    
    @objc func handleHeaderTap(sender: UIGestureRecognizer) {
        guard let model = headerModel as? TappableCell else { return }
        model.action()
    }
}

extension SimpleSection: UITableViewDelegate {
    @objc func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let model = models[safe: indexPath.row] else {
            NSLog("OUT OF INDEX: didSelectRowAt \(indexPath.row)")
            return
        }
        
        if let model = model as? TappableCell {
            model.action()
        }
    }
}


extension Array {
    subscript (safe index: Int) -> Element? {
        return index < count ? self[index] : nil
    }
}
