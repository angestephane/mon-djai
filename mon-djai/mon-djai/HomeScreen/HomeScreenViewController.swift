//
//  ViewController.swift
//  mon-djai
//
//  Created by user.local on 28/7/2023.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    var stackView = UIStackView()
    var welcomLabel = UILabel()
    var logoutButton = UIButton(type: .system)
    
    weak var delegate: LogoutDelegate?
    
    override func viewDidLoad() {
        style()
        layout()
    }
}

extension HomeScreenViewController {
    func style() {
        stackView.addArrangedSubview(welcomLabel)
        stackView.addArrangedSubview(logoutButton)
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        
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
            logoutButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 8),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 8)
        ])
    }
}

// MARK: - Actions

extension HomeScreenViewController {
    @objc func logout() {
        delegate?.didLogout()
    }
}
