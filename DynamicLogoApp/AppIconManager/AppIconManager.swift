//
//  AppIconManager.swift
//  DynamicLogoApp
//
//  Created by Levent ÖZGÜR on 21.02.23.
//

import Foundation
import UIKit

protocol AppIconMamangerInterface {
    func changeAppIcon(_ appIcon: AppIcon, complation: (() -> Void)?)
    func changeAppIconAsDefault(complation: (() -> Void)?)
}

final class AppIconMamanger {
    //Get current app icon name
    var current: AppIcon {
        return AppIcon.allCases.first { $0.name == UIApplication.shared.alternateIconName } ?? .appIcon1
    }
}

extension AppIconMamanger: AppIconMamangerInterface {
    //Change app icon with icon name
    func changeAppIcon(_ appIcon: AppIcon, complation: (() -> Void)? = nil) {
        guard current != appIcon, UIApplication.shared.supportsAlternateIcons else { return }

        UIApplication.shared.setAlternateIconName(appIcon.name) { error in
            guard error == nil else {
                print(String(describing: error?.localizedDescription))
                return
            }

            complation?()
        }
    }

    //Change app icon as default
    func changeAppIconAsDefault(complation: (() -> Void)? = nil) {
        UIApplication.shared.setAlternateIconName(nil) { error in
            guard error == nil else {
                print(String(describing: error?.localizedDescription))
                return
            }

            complation?()
        }
    }
}
