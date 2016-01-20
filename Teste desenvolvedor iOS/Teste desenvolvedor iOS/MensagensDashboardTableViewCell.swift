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
        
        let bordaInferior = CALayer()
        bordaInferior.backgroundColor = UIColor.corCinzaN1().CGColor
        bordaInferior.frame = CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 1.0, CGRectGetWidth(self.contentView.frame), 1.0)
        self.contentView.layer.addSublayer(bordaInferior)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumInteritemSpacing = 27.0
        self.collectionMensagens.collectionViewLayout = flowLayout

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
