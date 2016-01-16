//
//  MensagensViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MensagensViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mensagens"
        
        let button = UIButton()
        button.setImage(UIImage(named: "ico_menu.png"), forState: .Normal)
        button.addTarget(self, action:"abrirMenu:", forControlEvents: .TouchUpInside)
        button.frame=CGRectMake(0, 0, 20, 14)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    
    func abrirMenu(sender: UIButton) {
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
