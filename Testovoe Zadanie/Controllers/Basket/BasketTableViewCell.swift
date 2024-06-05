//
//  BasketTableViewCell.swift
//  Testovoe Zadanie
//
//  Created by Serper Kurmanbek on 05.06.2024.
//

import UIKit
import SnapKit

class BasketTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    private var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private var priceLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(80)
            make.left.equalToSuperview().inset(24)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.equalTo(image.snp.right).offset(8)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(image.snp.right).offset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(array: Product){
        image.image = UIImage(named: array.image)
        nameLabel.text = array.title
        priceLabel.text = array.price
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
