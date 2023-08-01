//
//  UIViewController+Utils.swift
//  mon-djai
//
//  Created by user.local on 29/7/2023.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let navBarApparence = UINavigationBarAppearance()
        navBarApparence.configureWithTransparentBackground()
        navBarApparence.backgroundColor = .systemBackground
        UINavigationBar.appearance().standardAppearance = navBarApparence
        UINavigationBar.appearance().scrollEdgeAppearance = navBarApparence
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
