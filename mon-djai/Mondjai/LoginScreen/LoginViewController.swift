//
//  ViewController.swift
//  mon-djai
//
//  Created by user.local on 23/7/2023.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

class LoginViewController: UIViewController {
    
    let greetingMessage = GreetingMessage()
    let loginView = LoginView()
    let signInButton = ButtonView()
    let errorMessageLabel = ErrorMessageView()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    // Animation
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var greetingLeadingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    private func style() {
        view.backgroundColor = .systemBackground
        
        greetingMessage.translatesAutoresizingMaskIntoConstraints = false
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(greetingMessage)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Greeting constraint
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: greetingMessage.trailingAnchor, multiplier: 2),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: greetingMessage.bottomAnchor, multiplier: 6)
        ])
        
        greetingLeadingAnchor = greetingMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        greetingLeadingAnchor?.isActive = true
        
        // LoginView constraints
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        // ButtonView constraints
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
        ])
        
        // Error message constraints
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}

// MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(_ sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard
            let username = username,
            let password = password
        else {
            assertionFailure("username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            errorMessageLabel.showLabel(withMessage: "Please, Username / password cannot be empty.")
            return
        }
        
        if username == "Stephane" && password == "Stephane" {
            signInButton.setActivityIndicator()
            delegate?.didLogin()
        } else {
            errorMessageLabel.showLabel(withMessage: "Incorrect Username / Paswword.")
        }
    }
}

extension LoginViewController {
    private func animate() {
        let duration = 1.0
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.greetingLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        greetingMessage.animateTitle(with: duration)
    }
}
