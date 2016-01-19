//
//  CustomTabBarViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 17/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

protocol CustomTabBarViewControllerDelegate {
    func customTabBarCliqueBotao(tag: Int)
}

class CustomTabBarViewController: UIViewController {
    
    @IBOutlet weak var botaoMensagens: UIButton!
    @IBOutlet weak var botaoMinhasVendas: UIButton!
    @IBOutlet weak var botaoNotificacoes: UIButton!
    
    var delegate: CustomTabBarViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        botaoMensagens.addTarget(self, action: "cliqueBotao:", forControlEvents: .TouchUpInside)
        botaoMinhasVendas.addTarget(self, action: "cliqueBotao:", forControlEvents: .TouchUpInside)
        botaoNotificacoes.addTarget(self, action: "cliqueBotao:", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cliqueBotao(sender: UIButton) {
        self.delegate?.customTabBarCliqueBotao(sender.tag)
    }

}
