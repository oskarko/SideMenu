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

    private var menuController: MenuController!
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

    override var prefersStatusBarHidden: Bool {
        return isExpanded
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
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }

    private func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0, options: .curveEaseInOut, animations: {

                            self.centerController.view.frame.origin.x =
                                self.centerController.view.frame.width - 80

                           },
                           completion: nil)

        } else {
            // hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0, options: .curveEaseInOut, animations: {

                            self.centerController.view.frame.origin.x = 0

                           }) { _ in
                // completion code
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption)
            }

            animateStatusBar()
        }
    }

    private func didSelectMenuOption(_ menuOption: MenuOption) {
        switch menuOption {

        case .profile:
            print("DEBUG: Show Profile")
        case .inbox:
            print("DEBUG: Show inbox")
        case .notifications:
            print("DEBUG: Show notifications")
        case .settings:
            print("DEBUG: Show settings")
        }
    }

    private func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0, options: .curveEaseInOut, animations: {

                        self.setNeedsStatusBarAppearanceUpdate()

                       },
                       completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate {

    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {

        if !isExpanded {
            configureMenuController()
        }
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
