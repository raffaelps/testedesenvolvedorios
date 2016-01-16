//
//  MenuTableViewCell.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagemOpcao: UIImageView!
    @IBOutlet weak var nomeOpcao: UILabel!
    @IBOutlet weak var valorOpcao: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
