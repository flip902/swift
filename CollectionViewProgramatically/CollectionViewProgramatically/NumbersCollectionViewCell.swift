//
//  NumbersCollectionViewCell.swift
//  CollectionViewProgramatically
//
//  Created by Phillip Carlino on 2017-09-18.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

class NumbersCollectionviewCell: UICollectionViewCell {
    
    var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
  
    
    func commonInit() {
        label = UILabel(frame: contentView.frame)
        contentView.addSubview(label)
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: 12)
        self.contentView.backgroundColor = .white
    }
}
