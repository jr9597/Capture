//
//  TableViewCell.swift
//  Capture
//
//  Jerrod Kim
//  jiryangk@usc.edu
//  Created by Jerrod Kim on 12/13/19.
//  Copyright © 2019 Jerrod Kim. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell  {

    @IBOutlet weak var videoImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
