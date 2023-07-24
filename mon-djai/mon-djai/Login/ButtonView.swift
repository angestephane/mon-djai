//
//  ButtonView.swift
//  mon-djai
//
//  Created by user.local on 23/7/2023.
//

import Foundation
import UIKit

class ButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ButtonView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .filled()
        configuration?.imagePadding = 8 // We'll add space if login is successfully
        configuration?.imagePlacement = .trailing
        setTitle("Sign In", for: [])
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10)
    }
    
    func layout() {}
}

extension ButtonView {
    func setActivityIndicator() {
        configuration?.showsActivityIndicator = true
    }
}

