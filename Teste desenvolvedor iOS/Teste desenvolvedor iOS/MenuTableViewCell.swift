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
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //Percorre as subviews da celula, encontra o UILabel que possui o valor e mantem a cor do background ao ser selecionado.
        for subview in self.contentView.subviews {
            if (subview.tag == 2)
            {
                let label = subview as! UILabel
                label.backgroundColor = UIColor.corLaranja()
            }
        }
    }

}
