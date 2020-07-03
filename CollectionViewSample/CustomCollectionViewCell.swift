//
//  CustomCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by SRA01 on 2020/07/03.
//  Copyright © 2020 SRA01. All rights reserved.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let testView = UIView()
        testView.backgroundColor = UIColor.brown
        self.backgroundView = testView
        
        self.label = UILabel(frame: CGRect(
            x: 0,
            y: self.frame.height / 2,
            width: self.frame.width,
            height: self.frame.height / 2
        ))
        if let label = self.label {
            label.text = "test"
            label.textAlignment = .center
            self.addSubview(label)
        }
        
        let boxSize = frame.width * 0.3
        
        let falseBox = CheckBoxView(frame: CGRect(x: 0, y: 0, width: boxSize, height: boxSize), selected: false)
        self.addSubview(falseBox)
        
        let trueBox = CheckBoxView(frame: CGRect(x: 0, y: 0, width: boxSize, height: boxSize), selected: true)
        let backView = UIView(frame: frame)
        backView.backgroundColor = UIColor.clear
        backView.addSubview(trueBox)
        self.selectedBackgroundView = backView
    }
}
