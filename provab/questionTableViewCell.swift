//
//  questionTableViewCell.swift
//  provab
//
//  Created by PRoVMac on 25/04/19.
//  Copyright © 2019 strlabz. All rights reserved.
//

import UIKit

class questionTableViewCell: UITableViewCell {

    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var option3: UILabel!
    
    @IBOutlet weak var opt1: UIButton!
    
    @IBOutlet weak var opt2: UIButton!
    
    @IBOutlet weak var opt3: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
