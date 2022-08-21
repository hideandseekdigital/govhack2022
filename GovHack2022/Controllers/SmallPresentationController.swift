//
//  SortPresentationController.swift
//
//  Created by Adam Balzan on 10/26/18.
//

import UIKit

class SmallPresentationController: UIPresentationController {
    @objc var defaultHeight = CGFloat(330)

    override var frameOfPresentedViewInContainerView: CGRect {
        var height: CGFloat = containerView!.bounds.height / 2
        if height > defaultHeight {
            height = defaultHeight
        }
        if height < defaultHeight {
            height = defaultHeight
        }
        return CGRect(x: 0, y: containerView!.bounds.height - height, width: containerView!.bounds.width, height: height)
    }

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
}

extension SmallPresentationController: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return self
    }
}
