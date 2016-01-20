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
        
        let border = CALayer()
        border.backgroundColor = UIColor.colorWithHexString("#f4f4f4").CGColor
        border.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 1.0)
        self.view.layer.addSublayer(border)

        botaoMensagens.addTarget(self, action: "cliqueBotao:", forControlEvents: .TouchUpInside)
        botaoMinhasVendas.addTarget(self, action: "cliqueBotao:", forControlEvents: .TouchUpInside)
        botaoNotificacoes.addTarget(self, action: "cliqueBotao:", forControlEvents: .TouchUpInside)
        
        botaoMensagens.setImage(UIImage(named: "ico_mensagem.png"), forState: .Normal)
        botaoMensagens.imageView?.contentMode = .ScaleAspectFit
        
        botaoMinhasVendas.setImage(UIImage(named: "ico_minhas_vendas.png"), forState: .Normal)
        botaoMinhasVendas.imageView?.contentMode = .ScaleAspectFit
        
        botaoNotificacoes.setImage(UIImage(named: "ico_notificacoes.png"), forState: .Normal)
        botaoNotificacoes.imageView?.contentMode = .ScaleAspectFit
    }
    
    override func viewDidLayoutSubviews() {
        
        adicionarSeparador(self.botaoMensagens)
        adicionarSeparador(self.botaoMinhasVendas)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cliqueBotao(sender: UIButton) {
        self.delegate?.customTabBarCliqueBotao(sender.tag)
    }
    
    func adicionarSeparador(view: AnyObject) {
        let separador = CALayer()
        separador.backgroundColor = UIColor.colorWithHexString("#f4f4f4").CGColor
        separador.frame = CGRectMake(CGRectGetWidth(view.frame), 20.0, 1.0, 28.0)
        view.layer.addSublayer(separador)
    }

}
