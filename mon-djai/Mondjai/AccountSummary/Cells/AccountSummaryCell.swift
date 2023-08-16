//
//  AccountSummaryCell.swift
//  mon-djai
//
//  Created by user.local on 6/8/2023.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Decimal
        
        var balanceAsAttributedString: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    
    let viewModel: ViewModel? = nil
    
    let accountTypeLabel = UILabel()
    let underlineView = UIView()
    let accountNameLabel = UILabel()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    let chevronImageView = UIImageView(
        image: UIImage(systemName: "chevron.right")?.withTintColor(.systemTeal, renderingMode: .alwaysOriginal))
    let balanceStackView = UIStackView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 115
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    private func setup() {
        accountTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        accountTypeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        accountTypeLabel.adjustsFontForContentSizeCategory = true
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .systemTeal
        
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.adjustsFontSizeToFitWidth = true
        balanceLabel.textAlignment = .right
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(balanceStackView)
        contentView.addSubview(accountTypeLabel)
        contentView.addSubview(underlineView)
        contentView.addSubview(accountNameLabel)
        contentView.addSubview(chevronImageView)
    }
    
    private func layer() {
        
        // Bank type label constraints
        NSLayoutConstraint.activate([
            accountTypeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            accountTypeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        
        // Underline view constraint
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: accountTypeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        // Account name label constrants
        NSLayoutConstraint.activate([
            accountNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            accountNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        
        // Balance StackView constraints
        NSLayoutConstraint.activate([
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
            balanceStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: accountNameLabel.trailingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 5)
        ])
        
        // Chevron icon constraints
        NSLayoutConstraint.activate([
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 2)
        ])
    }
}

extension AccountSummaryCell {
    func configure(with vm: ViewModel) {
        accountTypeLabel.text = vm.accountType.rawValue
        accountNameLabel.text = vm.accountName
        balanceAmountLabel.attributedText = vm.balanceAsAttributedString
        
        switch vm.accountType {
        case .Banking:
            underlineView.backgroundColor = .systemTeal
            balanceLabel.text = "Balance Actuelle"
        case .CreditCard:
            underlineView.backgroundColor = .systemOrange
            balanceLabel.text = "Balance Actuelle"
        case .Investment:
            underlineView.backgroundColor = .systemPurple
            balanceLabel.text = "Valeur"
        }
    }
}
