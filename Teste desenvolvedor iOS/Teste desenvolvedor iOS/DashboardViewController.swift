//
//  DashboardViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 14/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabBar: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tituloSaldo: UILabel!
    @IBOutlet weak var valorSaldo: UILabel!
    
    @IBOutlet weak var viewMensagens: UIView!
    @IBOutlet weak var tituloMensagens: UILabel!
    @IBOutlet weak var valorMensagens: UILabel!
    @IBOutlet weak var scrollMensagens: UIScrollView!
    
    var listaVendas = NSMutableArray()
    var formatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dashboard"
        
        customizarTela()
        recuperarSaldo()
        recuperarMensagens()
        carregarVendas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizarTela() {
        
        self.tableView.separatorStyle = .None
        
        navigationController?.navigationBar.barTintColor = UIColor.colorWithHexString("#E9351B")
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
    
    func abrirMenu(sender: UIButton) {
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
    }
    
    func recuperarSaldo() {
        self.valorSaldo.text = formatter.stringFromNumber(2152.23)
    }
    
    func recuperarMensagens() {
        
        var posicaoX : CGFloat = 0.0
        
        for (var i = 0; i < 8; i++) {
            
            let imagemPerfil = UIImageView(frame: CGRectMake(posicaoX, 0, 75, 75))
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
            nomePerfil.textColor = UIColor.colorWithHexString("#919191")
            nomePerfil.font = UIFont(name: "Helvetica", size: 13)
            nomePerfil.numberOfLines = 0
            
            var pessoa = Pessoa!()
            let random = Int(arc4random_uniform(4))
            
            switch random {
            case 0:
                pessoa = Pessoa(nome: "Pedro Matos", email: "", imagem: UIImage(named: "img_perfil.png"), mensagem: true)
                break
            case 1:
                pessoa = Pessoa(nome: "Valéria Ciqueira", email: "", imagem: nil, mensagem: false)
                break
            case 2:
                pessoa = Pessoa(nome: "Maria Carol", email: "", imagem: nil, mensagem: true)
                break
            default:
                pessoa = Pessoa(nome: "Flávia de Alcantara", email: "", imagem: nil, mensagem: false)
                break
            }
            
            if (pessoa.imagem != nil) {
                imagemPerfil.image = pessoa.imagem
            }
            else if (!pessoa.nome.isEmpty) {
                
                iconePerfil.text = String(pessoa.nome[pessoa.nome.startIndex])
                
                let random = Int(arc4random_uniform(3))
                
                switch random {
                case 0:
                    iconePerfil.backgroundColor = UIColor.colorWithHexString("#a3c74b")
                    break
                case 1:
                    iconePerfil.backgroundColor = UIColor.colorWithHexString("#ce4251")
                    break
                default:
                    iconePerfil.backgroundColor = UIColor.colorWithHexString("#5f498c")
                    break
                }
            }
            
            nomePerfil.text = pessoa.nome
            nomePerfil.sizeToFit()
            nomePerfil.frame = CGRectMake(posicaoX, CGRectGetMaxY(imagemPerfil.frame) + 3, 75, CGRectGetHeight(nomePerfil.frame))
            
            self.scrollMensagens.addSubview(imagemPerfil)
            self.scrollMensagens.addSubview(iconePerfil)
            self.scrollMensagens.addSubview(nomePerfil)
            
            posicaoX += 27.0 + imagemPerfil.frame.size.width
        }
        
        self.scrollMensagens.contentSize.width = CGFloat(posicaoX - 27.0)
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
    
    // MARK: - Tab bar delegate
    

}
