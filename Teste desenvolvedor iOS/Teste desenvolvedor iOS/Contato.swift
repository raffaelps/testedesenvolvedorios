//
//  Contato.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 19/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class Contato: NSObject {
    
    var nome: String = ""
    var caracterNome: String = ""
    var email: String = ""
    var alertaMensagem: Bool
    var imagem: UIImage!
    var corAtribuida: UIColor = UIColor.corAzul()
    
    init(nome: String, email: String, alerta: Bool, imagem: UIImage!) {
        self.nome = nome
        self.email = email
        self.alertaMensagem = alerta
        self.imagem = imagem
        
        self.caracterNome = String(self.nome[self.nome.startIndex])
        
        if ((imagem == nil)) {
            corAtribuida = UIColor.corAleatoria()
        }
    }

}
