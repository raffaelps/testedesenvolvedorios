//
//  MinhasVendasViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MinhasVendasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomTabBarViewControllerDelegate {

    var listaVendas = NSArray()
    var formatter = NSNumberFormatter()
    var customTabBar: CustomTabBarViewController!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Minhas Vendas", comment: "")
        
        self.navigationController!.navigationBar.barTintColor = UIColor.corAzul()
        
        let botaoMenu = UIButton()
        botaoMenu.setImage(UIImage(named: "ico_menu.png"), forState: .Normal)
        botaoMenu.addTarget(self, action:"abrirMenu:", forControlEvents: .TouchUpInside)
        botaoMenu.frame=CGRectMake(0, 0, 20, 14)
        let barButton = UIBarButtonItem(customView: botaoMenu)
        self.navigationItem.leftBarButtonItem = barButton
        
        formatter.numberStyle = .CurrencyStyle

        self.tableView.separatorStyle = .None
        
        carregarVendas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func abrirMenu(sender: UIButton) {
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
    }
    
    func carregarVendas() {
 
        listaVendas = ServicoVenda.recuperarVendas(20)
    }
    
    func customTabBarCliqueBotao(tag: Int) {
        
        switch tag {
        case 0:
            [self .performSegueWithIdentifier("minhasVendasMensagens", sender: nil)]
            break
        case 1:
            break
        case 2:
            break
        default:
            break
           }
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaVendas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("VendasTableViewCell", forIndexPath: indexPath) as! VendasTableViewCell
        
        let venda = listaVendas.objectAtIndex(indexPath.row) as! Venda
        cell.descricaoVenda.text = venda.descricao
        cell.detalheVenda.text = "id \(venda.identificador) • \(venda.data.formatDateWithFormat(NSLocalizedString("Formato data", comment: "")))"
        cell.valorVenda.text = formatter.stringFromNumber(venda.valor)
        cell.alertaVenda.hidden = !venda.alert
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.corCinzaN1()
        }
        else {
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 115
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "minhasVendasCustomTabBar") {
            customTabBar = segue.destinationViewController as! CustomTabBarViewController
            customTabBar.delegate = self
        }
    }

}
