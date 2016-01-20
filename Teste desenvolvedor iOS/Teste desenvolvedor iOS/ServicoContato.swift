//
//  ServicoContato.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 19/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class ServicoContato: NSObject {
    
    // Retorna uma lista com contatos simulados
    static func recuperarContatos(numeroContatos: Int) -> NSArray {
        
        let retorno = NSMutableArray()
        
        for (var i = 0; i < numeroContatos; i++) {
            let random = Int(arc4random_uniform(4))
            
            switch random {
            case 0:
                retorno.addObject(Contato(nome: "Pedro Matos", email: "", alerta: true, imagem: UIImage(named: "img_perfil.png")))
                break
            case 1:
                retorno.addObject(Contato(nome: "Valéria Ciqueira", email: "", alerta: false, imagem: nil))
                break
            case 2:
                retorno.addObject(Contato(nome: "Maria Carol", email: "", alerta: true, imagem: nil))
                break
            default:
                retorno.addObject(Contato(nome: "Flávia de Alcantara", email: "", alerta: false, imagem: nil))
                break
            }
        }
        
        return retorno
    }

}
