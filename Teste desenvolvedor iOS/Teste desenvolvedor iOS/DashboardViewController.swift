//
//  DashboardViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 14/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, CustomTabBarViewControllerDelegate {

    @IBOutlet weak var tabBar: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tituloSaldo: UILabel!
    @IBOutlet weak var valorSaldo: UILabel!
    
    var listaVendas = NSArray()
    var listaContatos = NSArray()
    var formatter = NSNumberFormatter()
    var customTabBar: CustomTabBarViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Dashboard", comment: "")
        
        customizarTela()
        recuperarSaldo()
        recuperarContatosMensagens()
        carregarVendas()
    }
    
    override func viewDidLayoutSubviews() {
        
//        let bordaInferior = CALayer()
//        bordaInferior.backgroundColor = UIColor.corCinzaN1().CGColor
//        bordaInferior.frame = CGRectMake(0, CGRectGetHeight(self.viewMensagens.frame) - 1.0, CGRectGetWidth(self.viewMensagens.frame), 1.0)
//        self.viewMensagens.layer.addSublayer(bordaInferior)
//        
//        let bordaLateralMensagens = CALayer()
//        bordaLateralMensagens.backgroundColor = UIColor.corLaranja().CGColor
//        bordaLateralMensagens.frame = CGRectMake(CGRectGetWidth(self.viewMensagens.frame) - 4.0, 0.0, 4.0, CGRectGetHeight(self.viewMensagens.frame))
//        self.viewMensagens.layer.addSublayer(bordaLateralMensagens)
        
        let bordaLateralMinhasVendas = CALayer()
        bordaLateralMinhasVendas.backgroundColor = UIColor.corAzul().CGColor
        bordaLateralMinhasVendas.frame = CGRectMake(CGRectGetWidth(self.tableView.frame) - 4.0, CGRectGetMinY(self.tableView.frame), 4.0, CGRectGetHeight(self.tableView.frame))
        self.view.layer.addSublayer(bordaLateralMinhasVendas)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizarTela() {
        
        self.tableView.separatorStyle = .None
        
        navigationController?.navigationBar.barTintColor = UIColor.corVermelhoN2()
        navigationController?.navigationBar.translucent = false
        
        //Retirar borda abaixo da navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let botaoMenu = UIButton()
        botaoMenu.setImage(UIImage(named: "ico_menu.png"), forState: .Normal)
        botaoMenu.addTarget(self, action:"abrirMenu:", forControlEvents: .TouchUpInside)
        botaoMenu.frame=CGRectMake(0, 0, 20, 14)
        let barButton = UIBarButtonItem(customView: botaoMenu)
        self.navigationItem.leftBarButtonItem = barButton
        
        formatter.numberStyle = .CurrencyStyle
        
        self.tituloSaldo.text = NSLocalizedString("Seu saldo atual e de:", comment: "")

    }
    
    func customTabBarCliqueBotao(tag: Int) {
        
        switch tag {
        case 0:
            [self.performSegueWithIdentifier("dashboardMensagens", sender: nil)]
            break
        case 1:
            [self.performSegueWithIdentifier("dashboardMinhasVendas", sender: nil)]
            break
        case 2:
            break
        default:
            break
        }
    }
    
    func abrirMenu(sender: UIButton) {
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
    }
    
    func recuperarSaldo() {
        self.valorSaldo.text = formatter.stringFromNumber(2152.23)
    }
    
    func recuperarContatosMensagens() {
        listaContatos = ServicoContato.recuperarContatos(8)
    }
    
    func carregarVendas() {
        listaVendas = ServicoVenda.recuperarVendas(5)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaVendas.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("MensagensDashboardTableViewCell", forIndexPath: indexPath) as! MensagensDashboardTableViewCell
            
            cell.tituloMensagens.text = NSLocalizedString("Mensagens recentes", comment: "")
            cell.numeroMensagens.text = "+10"
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("VendasTableViewCell", forIndexPath: indexPath) as! VendasTableViewCell
            
            let venda = listaVendas.objectAtIndex(indexPath.row - 1) as! Venda
            cell.descricaoVenda.text = venda.descricao
            cell.detalheVenda.text = "id \(venda.identificador) • \(venda.data.formatDateWithFormat("d/MM/YYYY"))"
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
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let collectionCell = cell as? MensagensDashboardTableViewCell
        collectionCell?.collectionMensagens.delegate = self
        collectionCell?.collectionMensagens.dataSource = self
        collectionCell?.collectionMensagens.reloadData()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 201 : 115
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Collection view data source
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaContatos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MensagensCollectionViewCell", forIndexPath: indexPath) as! MensagensCollectionViewCell
        
        let contato = listaContatos.objectAtIndex(indexPath.row) as! Contato
        cell.nomePerfil.text = contato.nome
        cell.alertaPerfil.hidden = !contato.alertaMensagem
        
        if (contato.imagem != nil) {
            cell.imagemPerfil.image = contato.imagem
            cell.imagemPerfil.hidden = false
            cell.iconePerfil.hidden = true
        }
        else {
            cell.iconePerfil.text = contato.caracterNome
            cell.iconePerfil.backgroundColor = contato.corAtribuida
            cell.imagemPerfil.hidden = true
            cell.iconePerfil.hidden = false
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 88.5, height: 135)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0, bottom: 0.0, right: 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "dashboardCustomTabBar") {
            customTabBar = segue.destinationViewController as! CustomTabBarViewController
            customTabBar.delegate = self
        }
    }

}
