//
//  NSDate.swift
//  Wishes
//
//  Created by Raffael Patrício de Souza on 29/07/15.
//  Copyright (c) 2015 RPS. All rights reserved.
//

import UIKit

extension NSDate
{
    func formatDateWithFormat(format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
}
