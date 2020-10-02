//
//  PreviewPresenterViewController.swift
//  Tatsi
//
//  Created by Nilson Souto on 10/2/20.
//  Copyright © 2020 awkward. All rights reserved.
//

import UIKit

class PreviewPresenterViewController: UIViewController {

    let contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        return contentView
    }()

    var contentInset = UIEdgeInsets(top: 44, left: 8, bottom: 44, right: 8)
    var centerOffset = CGPoint(x: 0, y: -52)

    weak var currentViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(contentView)
        view.backgroundColor = UIColor(white: 0, alpha: 0.35)
    }

    func present(_ viewController: UIViewController?) {
        if let currentVC = currentViewController {
            currentVC.willMove(toParent: nil)
            currentVC.view.removeFromSuperview()
            currentVC.removeFromParent()
        }

        currentViewController = viewController

        if let currentVC = currentViewController {
            addChild(currentVC)
            contentView.addSubview(currentVC.view)
            currentVC.didMove(toParent: self)

            NSLayoutConstraint.activate([
                currentVC.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                currentVC.view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                currentVC.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                currentVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])

            if currentVC.preferredContentSize.width > 0 && currentVC.preferredContentSize.height > 0 {
                let currentAspect = currentVC.preferredContentSize.width / currentVC.preferredContentSize.height
                let viewAspect = view.bounds.width / view.bounds.height

                if currentAspect > viewAspect {
                    contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerOffset.y).isActive = true
                    contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: contentInset.left).isActive = true
                    contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -contentInset.right).isActive = true
                    contentView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / currentAspect).isActive = true
                } else {
                    contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerOffset.x).isActive = true
                    contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: contentInset.top).isActive = true
                    contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -contentInset.bottom).isActive = true
                    contentView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: currentAspect).isActive = true
                }
            } else {
                // Expect the view's intrinsic content size to do the layout.
                contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerOffset.x).isActive = true
                contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerOffset.y).isActive = true
                contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: contentInset.left).isActive = true
            }
        }
    }

}
