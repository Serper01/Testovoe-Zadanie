//
//  SuccessBuyViewController.swift
//  Testovoe Zadanie
//
//  Created by Serper Kurmanbek on 05.06.2024.
//

import UIKit
import SnapKit
class SuccessBuyViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Оплачено!"
        label.numberOfLines = 2
        label.textColor = .green
        label.font = .italicSystemFont(ofSize: 28)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    



}
