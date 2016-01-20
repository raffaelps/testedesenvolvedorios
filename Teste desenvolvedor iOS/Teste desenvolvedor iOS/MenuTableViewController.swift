//
//  MenuTableViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 14/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var usuarioLogado: NSDictionary!
    var opcoesMenu: NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .None
        
        carregarOpcoesMenu()
        carregarDadosUsuario()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func carregarOpcoesMenu() {
        
        let keys = ["nomeOpcao", "imagemOpcao", "valorOpcao", "background"]
        
        opcoesMenu = NSMutableArray()
        opcoesMenu.addObject(NSDictionary(objects: [NSLocalizedString("Dashboard", comment: ""), "ico_dashboard.png", "", false], forKeys: keys))
        opcoesMenu.addObject(NSDictionary(objects: [NSLocalizedString("Minhas Vendas", comment: ""), "ico_minhas_vendas.png", "", false], forKeys: keys))
        opcoesMenu.addObject(NSDictionary(objects: [NSLocalizedString("Meus Produtos", comment: ""), "ico_meus_produtos.png", "", false], forKeys: keys))
        opcoesMenu.addObject(NSDictionary(objects: [NSLocalizedString("Afiliados", comment: ""), "ico_afiliados.png", "121", false], forKeys: keys))
        opcoesMenu.addObject(NSDictionary(objects: [NSLocalizedString("Mensagens", comment: ""), "ico_mensagem.png", "+50", true], forKeys: keys))
        opcoesMenu.addObject(NSDictionary(objects: [NSLocalizedString("Notificacoes", comment: ""), "ico_notificacoes.png", "15", true], forKeys: keys))
        opcoesMenu.addObject(NSDictionary(objects: [NSLocalizedString("Minha Conta", comment: ""), "ico_minha_conta.png", "", false], forKeys: keys))
        opcoesMenu.addObject(NSDictionary(objects: [NSLocalizedString("Sobre o App", comment: ""), "ico_sobre_o_app.png", "", false], forKeys: keys))
    }
    
    func carregarDadosUsuario() {
        usuarioLogado = NSDictionary(objects: ["Ricardo AC", "ricardoac@email.com", UIImage(named: "img_perfil.png")!], forKeys: ["nome", "email", "imagem"])
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
            
            cell.nomePerfil.text = (usuarioLogado.objectForKey("nome") as? String)?.uppercaseString
            cell.emailPerfil.text = usuarioLogado.objectForKey("email") as? String
            cell.imagemPerfil.image = usuarioLogado.objectForKey("imagem") as? UIImage
            cell.imagemBackground.image = usuarioLogado.objectForKey("imagem") as? UIImage
            
            cell.selectionStyle = .None
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCell", forIndexPath: indexPath) as! MenuTableViewCell
            
            let opcao = opcoesMenu.objectAtIndex(indexPath.row - 1) as! NSDictionary
            cell.nomeOpcao.text = opcao.objectForKey("nomeOpcao") as? String
            cell.imagemOpcao.image = UIImage(named: opcao.objectForKey("imagemOpcao") as! String)
            
            let valor = opcao.objectForKey("valorOpcao") as! String
            
            if (valor.isEmpty) {
                cell.valorOpcao.hidden = true
            }
            else {
                cell.valorOpcao.hidden = false
                cell.valorOpcao.text = valor
            }
            
            if (opcao.objectForKey("background") as! Bool) {
                cell.backgroundColor = UIColor.corCinzaN1()
                cell.nomeOpcao.textColor = UIColor.corCinzaN2()
            }
            else {
                cell.backgroundColor = UIColor.whiteColor()
                cell.textLabel?.textColor = UIColor.corCinzaN4()
            }
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 197 : 56
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            switch indexPath.row {
            case 1:
                let mainNavigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainNavigation") as! UINavigationController
                mainNavigation.navigationBar.barTintColor = UIColor.corVermelhoN2()
                drawerController.mainViewController = mainNavigation
                drawerController.setDrawerState(.Closed, animated: true)
                break
            case 2:
                let mainNavigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MinhasVendas") as! UINavigationController
                mainNavigation.navigationBar.barTintColor = UIColor.corAzul()
                drawerController.mainViewController = mainNavigation
                drawerController.setDrawerState(.Closed, animated: true)
                break
            case 5:
                let mainNavigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Mensagens") as! UINavigationController
                mainNavigation.navigationBar.barTintColor = UIColor.corLaranja()
                drawerController.mainViewController = mainNavigation
                drawerController.setDrawerState(.Closed, animated: true)
                break
            default:
                break
            }
            
        }
    }

}
