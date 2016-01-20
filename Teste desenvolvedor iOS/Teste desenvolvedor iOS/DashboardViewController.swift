//
//  DashboardViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 14/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomTabBarViewControllerDelegate {

    @IBOutlet weak var tabBar: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tituloSaldo: UILabel!
    @IBOutlet weak var valorSaldo: UILabel!
    
    @IBOutlet weak var viewMensagens: UIView!
    @IBOutlet weak var tituloMensagens: UILabel!
    @IBOutlet weak var valorMensagens: UILabel!
    @IBOutlet weak var scrollMensagens: UIScrollView!
    
    var listaVendas = NSArray()
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
        
        let bordaInferior = CALayer()
        bordaInferior.backgroundColor = UIColor.corCinzaN1().CGColor
        bordaInferior.frame = CGRectMake(0, CGRectGetHeight(self.viewMensagens.frame) - 1.0, CGRectGetWidth(self.viewMensagens.frame), 1.0)
        self.viewMensagens.layer.addSublayer(bordaInferior)
        
        let bordaLateralMensagens = CALayer()
        bordaLateralMensagens.backgroundColor = UIColor.corLaranja().CGColor
        bordaLateralMensagens.frame = CGRectMake(CGRectGetWidth(self.viewMensagens.frame) - 4.0, 0.0, 4.0, CGRectGetHeight(self.viewMensagens.frame))
        self.viewMensagens.layer.addSublayer(bordaLateralMensagens)
        
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
        
        self.tituloSaldo.text = "Seu saldo atual é de:"
        self.tituloMensagens.text = "Mensagens recentes"
        self.valorMensagens.text = "+10"

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
        preencherScrollViewMensagens(ServicoContato.recuperarContatos(8))
    }
    
    func preencherScrollViewMensagens(listaContatos: NSArray) {
        
        var posicaoX : CGFloat = 0.0
        
        for (var i = 0; i < listaContatos.count; i++) {
            
            let imagemPerfil = UIImageView(frame: CGRectMake(posicaoX, 0, 74, 74))
            imagemPerfil.contentMode = .ScaleAspectFill
            imagemPerfil.layer.cornerRadius = imagemPerfil.frame.size.width / 2;
            imagemPerfil.clipsToBounds = true
            
            let iconePerfil = UILabel(frame: imagemPerfil.frame)
            iconePerfil.textAlignment = .Center
            iconePerfil.textColor = UIColor.whiteColor()
            iconePerfil.font = UIFont(name: "Helvetica", size: 33)
            iconePerfil.layer.cornerRadius = imagemPerfil.frame.size.width / 2;
            iconePerfil.clipsToBounds = true
            
            let nomePerfil = UILabel(frame: CGRectMake(posicaoX, CGRectGetMaxY(imagemPerfil.frame) + 3, CGRectGetWidth(imagemPerfil.frame), 15))
            nomePerfil.textAlignment = .Center
            nomePerfil.textColor = UIColor.corCinzaN3()
            nomePerfil.font = UIFont(name: "Helvetica", size: 13)
            nomePerfil.numberOfLines = 0
            
            let contato = listaContatos.objectAtIndex(i) as! Contato

            if (contato.imagem != nil) {
                imagemPerfil.image = contato.imagem
            }
            else {
                iconePerfil.text = contato.caracterNome
                iconePerfil.backgroundColor = contato.corAtribuida
            }
            
            nomePerfil.text = contato.nome
            nomePerfil.sizeToFit()
            nomePerfil.frame = CGRectMake(posicaoX, CGRectGetMaxY(imagemPerfil.frame) + 3, 74, CGRectGetHeight(nomePerfil.frame))
            
            self.scrollMensagens.addSubview(imagemPerfil)
            self.scrollMensagens.addSubview(iconePerfil)
            self.scrollMensagens.addSubview(nomePerfil)
            
            posicaoX += imagemPerfil.frame.size.width
            
            // Não adiciona a diferença entre as imagens para o último contato
            if (i != (listaContatos.count - 1)) {
                posicaoX += 27.0
            }
        }
        
        self.scrollMensagens.contentSize.width = CGFloat(posicaoX)
    }

    func carregarVendas() {
        
        listaVendas = ServicoVenda.recuperarVendas(5)
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "dashboardCustomTabBar") {
            customTabBar = segue.destinationViewController as! CustomTabBarViewController
            customTabBar.delegate = self
        }
    }

}
