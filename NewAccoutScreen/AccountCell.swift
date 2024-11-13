//
//  AccountCell.swift
//  NewAccoutScreen
//
//  Created by Khaled Hamdy on 13/11/2024.
//

import UIKit

class AccountCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KW")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let accountNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "981027436799"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accountTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Current"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "1,44,000.75 KWD"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(flagImageView)
        containerView.addSubview(accountNumberLabel)
        containerView.addSubview(accountTypeLabel)
        containerView.addSubview(balanceLabel)
        containerView.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            flagImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            flagImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            flagImageView.widthAnchor.constraint(equalToConstant: 24),
            flagImageView.heightAnchor.constraint(equalToConstant: 24),
            
            accountNumberLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor),
            accountNumberLabel.centerYAnchor.constraint(equalTo: flagImageView.centerYAnchor),
            
            accountTypeLabel.leadingAnchor.constraint(equalTo: flagImageView.leadingAnchor),
            accountTypeLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 4),
            
            balanceLabel.leadingAnchor.constraint(equalTo: flagImageView.leadingAnchor),
            balanceLabel.topAnchor.constraint(equalTo: accountTypeLabel.bottomAnchor, constant: 8),
            balanceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
            arrowImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    func configure(model: NewAccountModel) {
        accountNumberLabel.text = model.accountNumber
        accountTypeLabel.text = model.status
        balanceLabel.text = model.balance
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
