//
//  MainViewController.swift
//  mon-djai
//
//  Created by user.local on 30/7/2023.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    func setupViews() {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        summaryNC.setStatusBar()
        
        /*
        summaryNC.navigationBar.barTintColor = .systemTeal
        moreNC.navigationBar.barTintColor = .systemTeal
        moneyNC.navigationBar.barTintColor = .systemTeal
        hideNavigationBarLine(summaryNC.navigationBar)
        hideNavigationBarLine(moreNC.navigationBar)
        hideNavigationBarLine(moneyNC.navigationBar)
         */
        
        
        let tabBarList = [summaryNC, moneyNC, moreNC]
        
        viewControllers = tabBarList
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .systemTeal
        tabBar.isTranslucent = false
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        title = "Move money"
        view.backgroundColor = .systemBlue
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "More"
        view.backgroundColor = .systemMint
    }
}
