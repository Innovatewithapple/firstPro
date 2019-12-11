//
//  Privacy&Security.swift
//  FirstPro
//
//  Created by Tarun Meena on 03/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class Privacy_Security: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setPrivacySecurityNavBar()
        // Do any additional setup after loading the view.
    }
    
    func setPrivacySecurityNavBar() {
        self.navigationItem.title          = "Privacy&Security"
        let gradientLayer                  = CAGradientLayer()
        var updatedFrame                   = self.navigationController!.navigationBar.bounds
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
        gradientLayer.frame                = updatedFrame
        gradientLayer.colors               = [UIColor.orange.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint           = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint             = CGPoint(x: 1.0, y: 0.0)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
