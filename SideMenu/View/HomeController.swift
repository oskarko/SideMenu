//
//  HomeController.swift
//  SideMenu
//
//  Created by Oscar Rodriguez Garrucho on 27/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    // MARK: - Properties

    var delegate: HomeControllerDelegate?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureNavigationBar()
    }

    // MARK: - Selectors

    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }

    // MARK: - Helpers

    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black

        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"),
                                                           style: .plain,
                                                           target: self,
                                                           action:
                                                            #selector(handleMenuToggle))

    }
}
