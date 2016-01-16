//
//  DashboardViewController.swift
//  Teste desenvolvedor iOS
//
//  Created by Raffael Patrício de Souza on 14/01/16.
//  Copyright © 2016 Raffael Patrício de Souza. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dashboard"
        
        navigationController?.navigationBar.barTintColor = UIColor.colorWithHexString("#d04f2a")
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let button = UIButton()
        button.setImage(UIImage(named: "ico_menu.png"), forState: .Normal)
        button.addTarget(self, action:"abrirMenu:", forControlEvents: .TouchUpInside)
        button.frame=CGRectMake(0, 0, 20, 14)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func abrirMenu(sender: UIButton) {
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
