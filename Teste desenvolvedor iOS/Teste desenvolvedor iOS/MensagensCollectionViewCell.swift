//
//  MensagensCollectionViewCell.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MensagensCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemPerfil: UIImageView!
    @IBOutlet weak var alertaPerfil: UIImageView!
    @IBOutlet weak var nomePerfil: UILabel!
    @IBOutlet weak var iconePerfil: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imagemPerfil.layer.cornerRadius = imagemPerfil.frame.size.width / 2;
        imagemPerfil.clipsToBounds = true
        
        iconePerfil.layer.cornerRadius = imagemPerfil.frame.size.width / 2;
        iconePerfil.clipsToBounds = true
        
        nomePerfil.numberOfLines = 2;
    }
}
