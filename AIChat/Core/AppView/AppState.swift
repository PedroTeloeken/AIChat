//
//  AppState.swift
//  AIChat
//
//  Created by Pedro Teloeken on 02/12/25.
//

import SwiftUI
internal import Combine

@Observable
class AppState {
    
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.showTabbarView = showTabBar
        }
    }
    
    init(showTabBar: Bool = UserDefaults.showTabbarView) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBarView: Bool) {
        self.showTabBar = showTabBarView
    }
}

extension UserDefaults {
    private struct Keys {
        static let showTabbarView = "showTabbarView"
    }
    
    static var showTabbarView: Bool {
        get {
            standard.bool(forKey: Keys.showTabbarView)
        }
        set {
            standard.set(newValue, forKey: Keys.showTabbarView)
        }
    }
}
