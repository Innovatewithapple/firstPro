//
//  ChatController.swift
//  FirstPro
//
//  Created by Tarun Meena on 04/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class ChatController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func action(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "jobPortalController", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "JobPortalController") as! JobPortalController
        self.navigationController?.pushViewController(newViewController, animated: true)
        
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
