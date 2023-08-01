//
//  ErrorMessageView.swift
//  mon-djai
//
//  Created by user.local on 24/7/2023.
//

import Foundation
import UIKit

class ErrorMessageView: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ErrorMessageView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        textColor = .systemRed
        numberOfLines = 0
        isHidden = true
    }
    
    func layout() {}
}

extension ErrorMessageView {
    
    func showLabel(withMessage massage: String ) {
        isHidden = false
        isEmpty(massage)
    }
    
    private func isEmpty(_ message: String) {
        text = message
    }
}

