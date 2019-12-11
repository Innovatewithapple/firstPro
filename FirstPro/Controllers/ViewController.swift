//
//  ViewController.swift
//  FirstPro
//
//  Created by Tarun Meena on 02/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
//        //for gradient navBar
//        self.navigationItem.title = "Chat Setting"
//        let gradientLayer = CAGradientLayer()
//        var updatedFrame = self.navigationController!.navigationBar.bounds
//        updatedFrame.size.height += UIApplication.shared.statusBarFrame.size.height
//        gradientLayer.frame = updatedFrame
//        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.orange.cgColor] // start color and end color
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0) // Horizontal gradient start
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0) // Horizontal gradient end
//        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
//        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
//
//
//        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setNavBar() {
        self.navigationItem.title          = "Chat Setting"
        let gradientLayer                  = CAGradientLayer()
        var updatedFrame                   = self.navigationController!.navigationBar.bounds
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
        gradientLayer.frame                = updatedFrame
        gradientLayer.colors               = [UIColor.orange.cgColor, UIColor.yellow.cgColor]
        gradientLayer.startPoint           = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint             = CGPoint(x: 15.0, y: 0.0)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }

}

