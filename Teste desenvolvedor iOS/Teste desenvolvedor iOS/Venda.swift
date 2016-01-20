//
//  Venda.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 19/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class Venda: NSObject {

    var descricao: String = ""
    var identificador: String = ""
    var data: NSDate!
    var valor: Double = 0.0
    var alert: Bool!
    
    init(descricao: String, identificador: String, data: NSDate, valor: Double, alert: Bool) {
        self.descricao = descricao
        self.identificador = identificador
        self.data = data
        self.valor = valor
        self.alert = alert
    }
}
