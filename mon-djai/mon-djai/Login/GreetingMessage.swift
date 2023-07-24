//
//  GreetingMessage.swift
//  mon-djai
//
//  Created by user.local on 24/7/2023.
//

import Foundation
import UIKit

class GreetingMessage: UIView {
    
    let title = UILabel()
    let subTitle = UILabel()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GreetingMessage {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Mondjai"
        title.textAlignment = .center
        title.font = .monospacedSystemFont(ofSize: 31, weight: .bold)
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.text = "Gérer vos finances en toute simplicité."
        subTitle.textAlignment = .center
        subTitle.font = .monospacedSystemFont(ofSize: 19, weight: .regular)
        subTitle.numberOfLines = 0
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 35
    }
    func layout() {
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subTitle)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}
