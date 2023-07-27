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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
        window?.backgroundColor = .systemBackground
        //window?.rootViewController = loginViewController
        window?.rootViewController = onboardingContainerViewController
        //window?.rootViewController = OnboardingViewController()
        
        return true
    }
    
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("What up!")
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("close onboarding")
    }
}

