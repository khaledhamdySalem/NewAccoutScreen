//
//  ViewController.swift
//  NewAccoutScreen
//
//  Created by Khaled Hamdy on 13/11/2024.
//


import UIKit

class NewAccountsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    
    var models: [NewAccountModel] = [
        .init(accountNumber: "981027436799", status: "Current", balance: "1200000.75 KWD"),
        .init(accountNumber: "981027436799", status: "Current", balance: "1300030.75 KWD"),
        .init(accountNumber: "981027436799", status: "Current", balance: "1300000.75 KWD"),
        .init(accountNumber: "999999999999", status: "Current", balance: "1200300.75 KWD")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Accounts"
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AccountCell.self, forCellReuseIdentifier: "AccountCell")
        tableView.register(NewAccountCell.self, forCellReuseIdentifier: "NewAccountCell")
        tableView.separatorStyle = .none
        
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == models.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewAccountCell", for: indexPath) as! NewAccountCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
            cell.configure(model: models[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == models.count {
            print("Open new account tapped")
        } else {
            print("Account \(indexPath.row) tapped")
        }
    }
}

