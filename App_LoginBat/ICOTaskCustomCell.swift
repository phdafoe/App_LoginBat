//
//  ICOTaskCustomCell.swift
//  AppRecordar1.0
//
//  Created by User on 6/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ICOTaskCustomCell: UITableViewCell {
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var myImagenIconTarea: UIImageView!
    @IBOutlet weak var myTextoTarea: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
