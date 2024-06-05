//
//  MainPageCollectionViewCell.swift
//  Testovoe Zadanie
//
//  Created by Serper Kurmanbek on 05.06.2024.
//

import UIKit
import SnapKit

class MainPageCollectionViewCell: UICollectionViewCell {
    
    var added = false

    // MARK: - UI Elements
    private var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    private var priceLabel: UILabel = {
        var priceLabel = UILabel()
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textAlignment = .left
        priceLabel.textColor = .black
        return priceLabel
    }()
    
    private var addButton: UIButton = {
        var addButton = UIButton()
        addButton.setImage(UIImage(systemName: "heart"), for: .normal)
        addButton.backgroundColor = .clear
        addButton.layer.cornerRadius = 12
        addButton.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        return addButton
    }()
    
    override init(frame: CGRect){
        super.init(frame:frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension
extension MainPageCollectionViewCell {
    
    @objc func addToBasket(){
        added.toggle()
        
        let newElement = Product(title: self.titleLabel.text ?? "", price: self.priceLabel.text ?? "", image: self.titleLabel.text ?? "")
        
        if added {
            addButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            do{
                if let data = UserDefaults.standard.data(forKey: "Basket"){
                    var array = try JSONDecoder().decode([Product].self, from: data)
                    array.append(newElement)
                    let encodedata = try JSONEncoder().encode(array)
                    UserDefaults.standard.set(encodedata,forKey: "Basket")
                } else{
                    let encodedata = try JSONEncoder().encode([newElement])
                    UserDefaults.standard.set(encodedata,forKey: "Basket")
                }
            }catch{
                print("Unable to encode \(error)")
            }
        }else{
            addButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    func setupConstraints(){
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(200)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(12)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(12)
        }
        addButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.equalToSuperview().offset(5)
            make.height.width.equalTo(24)
        }
    }
    
    func setData(array: Product) {
        self.imageView.image = UIImage(named: array.image)
        self.titleLabel.text = array.title
        self.priceLabel.text = array.price
    }
}
