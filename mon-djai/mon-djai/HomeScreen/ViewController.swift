//
//  ViewController.swift
//  mon-djai
//
//  Created by user.local on 28/7/2023.
//

import UIKit

protocol HomeScreenViewControllerDelegate: AnyObject {
    func didLogout()
}

class HomeScreenViewController: UIViewController {

    var welcomLabel = UILabel()
    var logoutButton = UIButton(type: .system)
    
    weak var delegate: HomeScreenViewControllerDelegate?
    
    override func viewDidLoad() {
        style()
        layout()
    }
}

extension HomeScreenViewController {
    func style() {
        view.addSubview(welcomLabel)
        view.addSubview(logoutButton)
        
        welcomLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomLabel.text = "Hello from mondjai"
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("logout", for: [])
        logoutButton.configuration = .filled()
        logoutButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        logoutButton.addTarget(self, action: #selector(logout), for: .primaryActionTriggered)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            welcomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalToSystemSpacingBelow: welcomLabel.bottomAnchor, multiplier: 2),
            logoutButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 10),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: logoutButton.trailingAnchor, multiplier: 10)
        ])
    }
}

// MARK: - Actions

extension HomeScreenViewController {
    @objc func logout() {
        delegate?.didLogout()
    }
}
