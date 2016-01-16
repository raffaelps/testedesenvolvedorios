//
//  Pessoa.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 16/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class Pessoa: NSObject {

    var nome: String = ""
    var email: String = ""
    var imagem: UIImage!
    
    init(nome: String, email: String, imagem: UIImage!) {
        self.nome = nome
        self.email = email
        self.imagem = imagem
    }
}
