//
//  PreviewDismissTransitionAnimator.swift
//  Tatsi
//
//  Created by Nilson Souto on 10/2/20.
//  Copyright © 2020 awkward. All rights reserved.
//

import UIKit

class PreviewDismissTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var contentView: UIView

    var duration: TimeInterval = 0.22

    init(contentView: UIView) {
        self.contentView = contentView
        super.init()
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let view = transitionContext.view(forKey: .from) else {
            transitionContext.completeTransition(true)
            return
        }

        UIView.animate(withDuration: duration, animations: {
            view.alpha = 0
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
