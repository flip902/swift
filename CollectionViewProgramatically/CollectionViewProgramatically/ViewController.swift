//
//  ViewController.swift
//  CollectionViewProgramatically
//
//  Created by Phillip Carlino on 2017-09-17.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var headerView: UIView!
    var titleLabel: UILabel!
    var numbersCollectionView: UICollectionView!
    let numbersCollectionViewDelegateAndDateSource = NumbersCollectionViewDelegateAndDateSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeaderAndTitleLabel()
        let frame = self.view.frame
        let layout = UICollectionViewFlowLayout()
        numbersCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        
        self.view.addSubview(numbersCollectionView)
        
        // layout contraints
        numbersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        numbersCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        numbersCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        numbersCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        numbersCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        // Register delegate
        numbersCollectionView.register(NumbersCollectionviewCell.self, forCellWithReuseIdentifier: "myCell")
        numbersCollectionView.delegate = numbersCollectionViewDelegateAndDateSource
        numbersCollectionView.dataSource = numbersCollectionViewDelegateAndDateSource
        
    }
    
    func setupHeaderAndTitleLabel() {
        
        headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.233700023, green: 0.5, blue: 0.8235294118, alpha: 1)
        self.view.addSubview(headerView)
        
        titleLabel = UILabel()
        titleLabel.text = "NUMBERS"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        headerView.addSubview(titleLabel)
        
        // set up contraints
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.10).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 0.4).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
        
    }

   

}

