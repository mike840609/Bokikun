//
//  RecordTableViewCell.swift
//  Bokikun
//
//  Created by 蔡鈞 on 19/12/2017.
//  Copyright © 2017 蔡鈞. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    var record : Record?{
        didSet{
            print("set data")
        }
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
