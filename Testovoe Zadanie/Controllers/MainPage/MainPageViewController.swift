//
//  MainPageViewController.swift
//  Testovoe Zadanie
//
//  Created by Serper Kurmanbek on 04.06.2024.
//

import UIKit
import SnapKit

class MainPageViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    var products: [Product] = [Product(title: "English Courses", price: "2500 тг", image: "Courses"),
                               Product(title: "Sony PS5", price: "250 000 тг", image: "Sony PS5")]
// MARK: - UI Elements
    private var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "Товары"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        return titleLabel
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 2
        layout.estimatedItemSize.height = 250
        layout.estimatedItemSize.width = 180
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MainPageCollectionViewCell.self,forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainPageCollectionViewCell
        cell.setData(array: products[indexPath.row])
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
}

// MARK: - Extension
extension MainPageViewController {
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
    }
    
    func setupConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
    }
}
