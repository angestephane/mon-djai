//
//  AppDelegate.swift
//  mon-djai
//
//  Created by user.local on 23/7/2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let homeScreenViewController = HomeScreenViewController()
    let defaults = UserDefaults.standard
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        homeScreenViewController.delegate = self
        
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
        //window?.rootViewController = onboardingContainerViewController
        //window?.rootViewController = OnboardingViewController()
        
        return true
    }
    
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animation: Bool = true) {
        guard animation, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        
        let hasOnboarding = defaults.bool(forKey: UserDefaultKey.hasOnboarding)
        
        if hasOnboarding {
            didFinishOnboarding()
        } else {
            setRootViewController(onboardingContainerViewController)
        }
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController, animation: false)
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        setRootViewController(homeScreenViewController, animation: false)
    }
}

