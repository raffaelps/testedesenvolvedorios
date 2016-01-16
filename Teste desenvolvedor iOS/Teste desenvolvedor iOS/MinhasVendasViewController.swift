//
//  MinhasVendasViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MinhasVendasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var listaVendas = NSMutableArray()
    var formatter = NSNumberFormatter()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Minhas vendas"
        
        UINavigationBar.appearance().barTintColor = UIColor.colorWithHexString("#4982c5")
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        formatter.numberStyle = .CurrencyStyle

        self.tableView.separatorStyle = .None
        
        carregarVendas()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func carregarVendas() {
 
        for (var i = 0; i < 10; i++) {
            let venda = Vendas(descricao: "Como decorar uma festa infantil maravilhosa com pouco dinheiro.", identificador: "30294080", data: NSDate(), valor: 1035.0, alert: i < 2)
            listaVendas.addObject(venda)
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
        
        let venda = listaVendas.objectAtIndex(indexPath.row) as! Vendas
        cell.descricaoVenda.text = venda.descricao
        cell.detalheVenda.text = "id \(venda.identificador) • \(venda.data.formatDateWithFormat("d/MM/YYYY"))"
        cell.valorVenda.text = formatter.stringFromNumber(venda.valor)
        cell.alertaVenda.hidden = !venda.alert
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.colorWithHexString("#f4f4f4")
        }
        else {
            cell.backgroundColor = UIColor.colorWithHexString("#ffffff")
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 115
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

}
