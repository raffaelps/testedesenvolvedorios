//
//  MensagensViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MensagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CustomTabBarViewControllerDelegate {
    
    var listaPessoas = NSMutableArray()
    var customTabBar: CustomTabBarViewController!
    
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mensagens"
        
        self.navigationController!.navigationBar.barTintColor = UIColor.colorWithHexString("#F89F2C")
        
        let botaoMenu = UIButton()
        botaoMenu.setImage(UIImage(named: "ico_menu.png"), forState: .Normal)
        botaoMenu.addTarget(self, action:"abrirMenu:", forControlEvents: .TouchUpInside)
        botaoMenu.frame=CGRectMake(0, 0, 20, 14)
        let barButton = UIBarButtonItem(customView: botaoMenu)
        self.navigationItem.leftBarButtonItem = barButton
        
        let numeroMensagens = UIBorderedLabel()
        numeroMensagens.text = "+10"
        numeroMensagens.font = UIFont(name: "Helvetica", size: 12)
        numeroMensagens.textAlignment = .Center
        numeroMensagens.textColor = UIColor.blackColor()
        numeroMensagens.backgroundColor = UIColor.whiteColor()
        numeroMensagens.frame = CGRectMake(0, 0, 30, 22)
        numeroMensagens.adjustsFontSizeToFitWidth = true
        let barBotaoNumeroMensagens = UIBarButtonItem(customView: numeroMensagens)
        self.navigationItem.rightBarButtonItem = barBotaoNumeroMensagens
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        carregarMensagens()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func abrirMenu(sender: UIButton) {
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
    }
    
    func carregarMensagens() {
        
        for (var i = 0; i < 28; i++) {
            
            let random = Int(arc4random_uniform(4))
            
            switch random {
            case 0:
                listaPessoas.addObject(Pessoa(nome: "Pedro Matos", email: "", imagem: UIImage(named: "img_perfil.png"), mensagem: true))
                break
            case 1:
                listaPessoas.addObject(Pessoa(nome: "Valéria Ciqueira", email: "", imagem: nil, mensagem: false))
                break
            case 2:
                listaPessoas.addObject(Pessoa(nome: "Maria Carol", email: "", imagem: nil, mensagem: true))
                break
            default:
                listaPessoas.addObject(Pessoa(nome: "Flávia de Alcantara", email: "", imagem: nil, mensagem: false))
                break
            }
        }
    }
    
    func customTabBarCliqueBotao(tag: Int) {
        
        switch tag {
        case 0:
            break
        case 1:
            [self .performSegueWithIdentifier("mensagensMinhasVendas", sender: nil)]
            break
        case 2:
            break
        default:
            break
        }
    }
    
    // MARK: - Collection view data source

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaPessoas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MensagensCollectionViewCell", forIndexPath: indexPath) as! MensagensCollectionViewCell
        
        let pessoa = listaPessoas.objectAtIndex(indexPath.row) as! Pessoa
        cell.nomePerfil.text = pessoa.nome
        cell.alertaPerfil.hidden = !pessoa.mensagem
        
        if (pessoa.imagem != nil) {
            cell.imagemPerfil.image = pessoa.imagem
        }
        else if (!pessoa.nome.isEmpty) {
            
            cell.iconePerfil.text = String(pessoa.nome[pessoa.nome.startIndex])
            
            let random = Int(arc4random_uniform(3))
            
            switch random {
            case 0:
                cell.iconePerfil.backgroundColor = UIColor.colorWithHexString("#a3c74b")
                break
            case 1:
                cell.iconePerfil.backgroundColor = UIColor.colorWithHexString("#ce4251")
                break
            default:
                cell.iconePerfil.backgroundColor = UIColor.colorWithHexString("#5f498c")
                break
            }
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
        if (segue.identifier == "mensagensCustomTabBar") {
            customTabBar = segue.destinationViewController as! CustomTabBarViewController
            customTabBar.delegate = self
        }
    }

}
