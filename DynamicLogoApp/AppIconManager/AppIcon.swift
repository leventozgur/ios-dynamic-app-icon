//
//  AppIconManager.swift
//  DynamicLogoApp
//
//  Created by Levent ÖZGÜR on 20.02.23.
//

import Foundation
import UIKit

enum AppIcon: CaseIterable {
    
    case appIcon1
    case appIcon2
    case appIcon3
    
    var name: String? {
        switch self {
        case .appIcon1:
            return "AppIcon-1"
        case .appIcon2:
            return "AppIcon-2"
        case .appIcon3:
            return "AppIcon-3"
        }
    }
}
