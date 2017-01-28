//
//  ICOContactosCustomCell.swift
//  App_TaskVersion2.0
//
//  Created by formador on 27/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICOContactosCustomCell: UITableViewCell {
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myImagenContactoIV: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
