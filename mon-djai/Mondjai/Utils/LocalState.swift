//
//  LocalState.swift
//  mon-djai
//
//  Created by user.local on 29/7/2023.
//

import Foundation

public class LocalState {
    
    private enum keys: String {
        case hasOnboarding
    }
    
    public static var hasOnboarding: Bool {
        get {
            return UserDefaults.standard.bool(forKey: keys.hasOnboarding.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: keys.hasOnboarding.rawValue)
        }
    }
}
