//
//  MensagensDashboardTableViewCell.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 20/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MensagensDashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloMensagens: UILabel!
    @IBOutlet weak var numeroMensagens: UILabel!
    @IBOutlet weak var collectionMensagens: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
