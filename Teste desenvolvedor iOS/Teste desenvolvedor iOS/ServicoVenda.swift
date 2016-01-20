//
//  ServicoVenda.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 19/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class ServicoVenda: NSObject {

    // Retorna uma lista com vendas simuladas
    static func recuperarVendas(numeroVendas: Int) -> NSArray {
        
        let retorno = NSMutableArray()
        
        for (var i = 0; i < numeroVendas; i++) {
            let random = Int(arc4random_uniform(4))
            
            switch random {
            case 0:
                retorno.addObject(Venda(descricao: "Como decorar uma festa infantil maravilhosa com pouco dinheiro.", identificador: "12294", data: NSDate(), valor: 1035.0, alert: true))
                break
            case 1:
                retorno.addObject(Venda(descricao: "Como reformar o carro com pouco dinheiro.", identificador: "4529434", data: NSDate(), valor: 135.0, alert: false))
                break
            case 2:
                retorno.addObject(Venda(descricao: "Como viajar com pouco dinheiro.", identificador: "89294564", data: NSDate(), valor: 10035.0, alert: true))
                break
            default:
                retorno.addObject(Venda(descricao: "Como mobiliar a casa com pouco dinheiro.", identificador: "30292324", data: NSDate(), valor: 1540.0, alert: false))
                break
            }
        }
        
        return retorno
    }
}
