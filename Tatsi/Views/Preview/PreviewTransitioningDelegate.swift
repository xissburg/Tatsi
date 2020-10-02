//
//  PreviewTransitioningDelegate.swift
//  Tatsi
//
//  Created by Nilson Souto on 10/2/20.
//  Copyright © 2020 awkward. All rights reserved.
//

import UIKit

class PreviewTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    let contentView: UIView

    init(contentView: UIView) {
        self.contentView = contentView
    }

    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return PreviewPresentationController(presentedViewController: presented, presenting: presenting, contentView: contentView)
    }

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PreviewPresentationTransitionAnimator(contentView: contentView)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PreviewDismissTransitionAnimator(contentView: contentView)
    }

}
