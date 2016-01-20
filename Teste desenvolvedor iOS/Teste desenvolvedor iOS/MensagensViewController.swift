//
//  MensagensViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class MensagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CustomTabBarViewControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var listaContatos = NSArray()
    var customTabBar: CustomTabBarViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Mensagens", comment: "")
        
        customizarTela()
        recuperarContatosMensagens()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func customizarTela() {
        self.navigationController!.navigationBar.barTintColor = UIColor.corLaranja()
        
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
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 26.0
        flowLayout.scrollDirection = .Vertical
        collectionView.collectionViewLayout = flowLayout
    }
    
    func abrirMenu(sender: UIButton) {
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
    }
    
    func recuperarContatosMensagens() {
        listaContatos = ServicoContato.recuperarContatos(40)
        self.collectionView.reloadData()
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
        return CGSize(width: 74, height: 135)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mensagensCustomTabBar") {
            customTabBar = segue.destinationViewController as! CustomTabBarViewController
            customTabBar.delegate = self
        }
    }

}
