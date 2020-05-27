//
//  DateCell.swift
//  Power-Planner-MRE
//
//  Created by Julian Boyko on 2020-05-27.
//  Copyright © 2020 Supreme Apps. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                dateLabel!.textColor = UIColor.red
            } else {
                dateLabel!.textColor = UIColor.darkText
            }
        }
    }
}
