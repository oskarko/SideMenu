//
//  SettingsController.swift
//  SideMenu
//
//  Created by Oscar Rodriguez Garrucho on 27/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    // MARK: - Properties


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selectors

    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Helpers

    private func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationBar(withTitle: "Settings", prefersLargeTitles: true)

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(handleDismiss))
    }
}
