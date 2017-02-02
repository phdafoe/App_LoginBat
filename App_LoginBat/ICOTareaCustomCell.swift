//
//  ICOTareaCustomCell.swift
//  App_LoginBat
//
//  Created by User on 31/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ICOTareaCustomCell: UITableViewCell {
    
    @IBOutlet weak var myIconoTarea: UIImageView!
    @IBOutlet weak var myDescripcionLBL: UILabel!
    @IBOutlet weak var myImagenTarea: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
