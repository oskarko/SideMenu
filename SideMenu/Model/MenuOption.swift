//
//  MenuOption.swift
//  SideMenu
//
//  Created by Oscar Rodriguez Garrucho on 27/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case profile
    case inbox
    case notifications
    case settings

    var description: String {
        switch self {
        case .profile: return "Profile"
        case .inbox: return "Inbox"
        case .notifications: return "Notifications"
        case .settings: return "Settings"
        }
    }

    var image: UIImage {
        switch self {
        case .profile: return UIImage(systemName: "person.fill") ?? UIImage()
        case .inbox: return UIImage(systemName: "envelope") ?? UIImage()
        case .notifications: return UIImage(systemName: "message") ?? UIImage()
        case .settings: return UIImage(systemName: "gear") ?? UIImage()
        }
    }
}
