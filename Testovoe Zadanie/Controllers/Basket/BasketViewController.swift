//
//  BasketViewController.swift
//  Testovoe Zadanie
//
//  Created by Serper Kurmanbek on 05.06.2024.
//

import UIKit
import SnapKit

class BasketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    var basketArray: [Product] = []
    
    // MARK: - UI Elements
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Корзина"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var buyButton: UIButton = {
        var button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 12
        button.tintColor = .white
        button.addTarget(self, action: #selector(buy), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        print(basketArray.count)
        
    }
    // MARK: - Life Cycle
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BasketTableViewCell
        cell.setData(array: basketArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            basketArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveProducts()
        } else if editingStyle == .insert {
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
// MARK: - Extension
extension BasketViewController {
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(buyButton)
    }
    
    func setupConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.left.equalToSuperview().inset(24)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(500)
        }
        buyButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(46)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func buy() {
        let successVC = SuccessBuyViewController()
        navigationController?.pushViewController(successVC, animated: true)
    }
    func saveProducts(){
        let defaults = UserDefaults.standard
        do{
            let encodedata = try JSONEncoder().encode(basketArray)
            defaults.set(encodedata, forKey: "Basket")
        } catch {
            print ("Unable to encode \(error)")
        }
    }
}
