//
//  PerfilTableViewCell.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class PerfilTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemBackground: UIImageView!
    @IBOutlet weak var imagemPerfil: UIImageView!
    @IBOutlet weak var nomePerfil: UILabel!
    @IBOutlet weak var emailPerfil: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imagemPerfil.layer.cornerRadius = imagemPerfil.frame.size.width / 2;
        imagemPerfil.clipsToBounds = true
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imagemBackground.frame
        imagemBackground.addSubview(blurView)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
