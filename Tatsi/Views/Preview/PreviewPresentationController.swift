//
//  PreviewPresentationController.swift
//  Tatsi
//
//  Created by Nilson Souto on 10/2/20.
//  Copyright © 2020 awkward. All rights reserved.
//

import UIKit

class PreviewPresentationController: UIPresentationController {

    let contentView: UIView

    init(presentedViewController: UIViewController,
         presenting presentingViewController: UIViewController?,
         contentView: UIView) {
        self.contentView = contentView
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }

    override func presentationTransitionWillBegin() {
        guard let view = presentedView else { return }

        contentView.alpha = 0
        contentView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.backgroundColor = .clear
    }

    override func presentationTransitionDidEnd(_ completed: Bool) {
        guard let view = presentedView else { return }
        view.layer.mask = nil
    }

}
