//
//  Extension+UIColor.swift
//  Wishes
//
//  Created by Raffael Patrício de Souza on 26/07/15.
//  Copyright (c) 2015 RPS. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func corAleatoria() -> UIColor {
        
        var retorno = UIColor!()
        let random = Int(arc4random_uniform(3))
        
        switch random {
        case 0:
            retorno = UIColor.corVerde()
            break
        case 1:
            retorno = UIColor.corVermelhoN1()
            break
        default:
            retorno = UIColor.corRoxo()
            break
        }
        
        return retorno
    }
    
    class func corLaranja() -> UIColor {
        return self.colorWithHexString("#F89F2C")
    }
    
    class func corVerde() -> UIColor {
        return self.colorWithHexString("#a3c74b")
    }
    
    class func corVermelhoN1() -> UIColor {
        return self.colorWithHexString("#ce4251")
    }
    
    class func corVermelhoN2() -> UIColor {
        return self.colorWithHexString("#E8351B")
    }
    
    class func corAzul() -> UIColor {
        return self.colorWithHexString("#196EBC")
    }
    
    class func corRoxo() -> UIColor {
        return self.colorWithHexString("#5f498c")
    }
    
    class func corCinzaN4() -> UIColor {
        return self.colorWithHexString("#535353")
    }
    
    class func corCinzaN3() -> UIColor {
        return self.colorWithHexString("#919191")
    }
    
    class func corCinzaN2() -> UIColor {
        return self.colorWithHexString("#b6b2a8")
    }
    
    class func corCinzaN1() -> UIColor {
        return self.colorWithHexString("#f4f4f4")
    }
    
    class func colorWithHexString (hex:AnyObject) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}
