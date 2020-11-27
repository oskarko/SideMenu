//
//  MenuOptionCell.swift
//  SideMenu
//
//  Created by Oscar Rodriguez Garrucho on 27/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    // MARK: - Properties

    var menuOption: MenuOption? {
        didSet{ configure() }
    }

    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        iv.tintColor = .white
        return iv
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .darkGray

        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true

        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    private func configure() {
        selectionStyle = .none
        iconImageView.image = menuOption?.image
        descriptionLabel.text = menuOption?.description
    }
}
