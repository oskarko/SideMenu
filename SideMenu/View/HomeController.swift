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
        configureNavigationBar(withTitle: "Side Menu", prefersLargeTitles: false)

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"),
                                                           style: .plain,
                                                           target: self,
                                                           action:
                                                            #selector(handleMenuToggle))

    }
}

extension UIViewController {

    func configureNavigationBar(withTitle title: String,
                                prefersLargeTitles: Bool,
                                barTintColor: UIColor = .darkGray) {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = barTintColor

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true

        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
}
