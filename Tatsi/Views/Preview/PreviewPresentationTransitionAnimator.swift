//
//  PreviewPresentationTransitionAnimator.swift
//  Tatsi
//
//  Created by Nilson Souto on 10/2/20.
//  Copyright © 2020 awkward. All rights reserved.
//

import UIKit

class PreviewPresentationTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

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
        guard let view = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(true)
            return
        }

        transitionContext.containerView.addSubview(view)

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            self.contentView.transform = .identity
        }, completion: nil)

        UIView.animate(withDuration: duration, animations: {
            self.contentView.alpha = 1
            view.backgroundColor = UIColor(white: 0, alpha: 0.35)
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
