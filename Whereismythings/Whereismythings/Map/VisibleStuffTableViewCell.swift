//
//  VisibleStuffTableViewCell.swift
//  Whereismythings
//
//  Created by 강희선 on 2021/01/23.
//

import UIKit

class VisibleStuffTableViewCell: UITableViewCell {
    @IBOutlet var stuffName: UILabel!
    @IBOutlet var stuffPos: UILabel!
    @IBOutlet var stuffImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
