//
//  VendasTableViewCell.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class VendasTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descricaoVenda: UILabel!
    @IBOutlet weak var detalheVenda: UILabel!
    @IBOutlet weak var valorVenda: UILabel!
    @IBOutlet weak var alertaVenda: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        descricaoVenda.numberOfLines = 2;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
