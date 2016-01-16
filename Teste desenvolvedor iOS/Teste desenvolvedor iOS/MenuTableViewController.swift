//
//  MenuTableViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 14/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var usuarioLogado: Pessoa!
    var opcoesMenu: NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.separatorStyle = .None
        
        carregarOpcoesMenu()
        carregarDadosUsuario()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func carregarOpcoesMenu() {
        opcoesMenu = NSMutableArray()
        opcoesMenu.addObject(NSDictionary(objects: ["Dashboard", "ico_dashboard.png"], forKeys: ["nomeOpcao", "imagemOpcao"]))
        opcoesMenu.addObject(NSDictionary(objects: ["Minhas Vendas", "ico_minhas_vendas.png"], forKeys: ["nomeOpcao", "imagemOpcao"]))
        opcoesMenu.addObject(NSDictionary(objects: ["Meus Produtos", "ico_meus_produtos.png"], forKeys: ["nomeOpcao", "imagemOpcao"]))
        opcoesMenu.addObject(NSDictionary(objects: ["Afiliados", "ico_afiliados.png"], forKeys: ["nomeOpcao", "imagemOpcao"]))
        opcoesMenu.addObject(NSDictionary(objects: ["Mensagens", "ico_mensagem.png"], forKeys: ["nomeOpcao", "imagemOpcao"]))
        opcoesMenu.addObject(NSDictionary(objects: ["Notificações", "ico_notificacoes.png"], forKeys: ["nomeOpcao", "imagemOpcao"]))
        opcoesMenu.addObject(NSDictionary(objects: ["Minha Conta", "ico_minha_conta.png"], forKeys: ["nomeOpcao", "imagemOpcao"]))
        opcoesMenu.addObject(NSDictionary(objects: ["Sobre o App", "ico_sobre_o_app.png"], forKeys: ["nomeOpcao", "imagemOpcao"]))
    }
    
    func carregarDadosUsuario() {
        usuarioLogado = Pessoa(nome: "RICARDO AC", email: "ricardoac@email.com", imagem: UIImage(named: "img_perfil.png"))
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opcoesMenu.count + 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("PerfilTableViewCell", forIndexPath: indexPath) as! PerfilTableViewCell
            
            cell.nomePerfil.text = usuarioLogado.nome
            cell.emailPerfil.text = usuarioLogado.email
            cell.imagemPerfil.image = usuarioLogado.imagem
            cell.imagemBackground.image = usuarioLogado.imagem
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCell", forIndexPath: indexPath) as! MenuTableViewCell
            
            let opcao = opcoesMenu.objectAtIndex(indexPath.row - 1) as! NSDictionary
            cell.nomeOpcao.text = opcao.objectForKey("nomeOpcao") as? String
            cell.imagemOpcao.image = UIImage(named: opcao.objectForKey("imagemOpcao") as! String)
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 197 : 56
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            let mainNavigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TesteNavigation") as! UINavigationController
            let backgroundColor: UIColor
            switch indexPath.row {
            case 0:
                backgroundColor = UIColor.redColor()
            case 1:
                backgroundColor = UIColor.blueColor()
            default:
                backgroundColor = UIColor.whiteColor()
            }
            mainNavigation.topViewController?.view.backgroundColor = backgroundColor
            drawerController.mainViewController = mainNavigation
            drawerController.setDrawerState(.Closed, animated: true)
        }
    }

}
