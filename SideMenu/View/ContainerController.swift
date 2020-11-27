//
//  ContainerController.swift
//  SideMenu
//
//  Created by Oscar Rodriguez Garrucho on 27/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

    // MARK: - Properties

    private var menuController: UIViewController!
    private var centerController: UIViewController!
    private var isExpanded = false

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Helpers

    private func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)

        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }

    private func configureMenuController() {
        if menuController == nil {
            // add our menu controller here

            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }

    private func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.0,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {

                            self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80

                           },
                           completion: nil)

        } else {
            // hide menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.0,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {

                            self.centerController.view.frame.origin.x = 0

                           },
                           completion: nil)
        }
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {

        if !isExpanded {
            configureMenuController()
        }

        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
}
