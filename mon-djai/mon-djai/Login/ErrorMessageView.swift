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
    
    func isEmpty() {
        text = "Please, must be not empty"
    }
}

extension ErrorMessageView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        textColor = .systemRed
        numberOfLines = 0
        isEmpty()
        //isHidden = true
    }
    
    func layout() {}
}

