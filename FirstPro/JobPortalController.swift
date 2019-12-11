//
//  JobPortalController.swift
//  FirstPro
//
//  Created by Tarun Meena on 07/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit
import SwiftyMenu

class JobPortalController: UIViewController {

   // var button = dropDownBtn()
    
    // buttons outlet
    @IBOutlet private weak var Accountant    : SwiftyMenu!
    @IBOutlet private weak var selectCounry  : SwiftyMenu!
    @IBOutlet private weak var selectState   : SwiftyMenu!
    @IBOutlet private weak var selectCity    : SwiftyMenu!
    
    //pickerview outlet
    @IBOutlet weak var accountantPickerView  : UIPickerView!
    @IBOutlet weak var countryPickerView     : UIPickerView!
    @IBOutlet weak var statePickerView       : UIPickerView!
    @IBOutlet weak var cityPickerView        : UIPickerView!
    
    private let dropDownOptionsDataSource = ["Option 1", "Option 2", "Option 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPortalNavBar()
        setDropDown()
    }
    // custom selection
    //customDropDownMenu
    func setDropDown() {
        
        // Setup component
        Accountant.delegate = self as? SwiftyMenuDelegate
        Accountant.options = dropDownOptionsDataSource
        
        // Support CallBacks
        Accountant.didExpand = {
            print("SwiftyMenu Expanded!")
        }
        
        Accountant.didCollapse = {
            print("SwiftyMeny Collapsed")
        }
        
        Accountant.didSelectOption = { (selection: Selection) in
            print("\(selection.value) at index: \(selection.index)")
        }
        
        // Custom Behavior
        Accountant.scrollingEnabled = false
        Accountant.isMultiSelect = false
        Accountant.hideOptionsWhenSelect = false
        
        // Custom UI
        Accountant.rowHeight = 35
        Accountant.listHeight = 150
        Accountant.borderWidth = 1.0
        
        // Custom Colors
        Accountant.borderColor = .black
        Accountant.optionColor = .black
        Accountant.placeHolderColor = .blue
        Accountant.menuHeaderBackgroundColor = .white
        Accountant.rowBackgroundColor = .white
        
        // Custom Animation
        Accountant.expandingAnimationStyle  = .spring(level: .low)
        Accountant.expandingDuration = 0.5
        Accountant.collapsingAnimationStyle = .linear
        Accountant.collapsingDuration = 0.5
    }
    
    
    //MARK:- Custom Nav Bar
    func setPortalNavBar() {
        self.navigationItem.title          = "Job Portal"
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
    
    @IBAction func hidePickerViewAction(_ sender: Any) {
        if accountantPickerView.isHidden == false {
            accountantPickerView.isHidden = true
        }
        
        if countryPickerView.isHidden == true {
            countryPickerView.isHidden = false
        }
        if statePickerView.isHidden == true {
            statePickerView.isHidden = false
        }
        if cityPickerView.isHidden == true {
            cityPickerView.isHidden = false
        }
        
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

// MARK: - SwiftMenuDelegate

extension ViewController: SwiftyMenuDelegate {
    func didSelectOption(_ swiftyMenu: SwiftyMenu, _ selectedOption: SwiftyMenuDisplayable, _ index: Int) {
        print("Selected option: \(selectedOption), at index: \(index)")
    }
    
    func swiftyMenuWillAppear(_ swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu will appear.")
    }
    
    func swiftyMenuDidAppear(_ swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu did appear.")
    }
    
    func swiftyMenuWillDisappear(_ swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu will disappear.")
    }
    
    func swiftyMenuDidDisappear(_ swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu did disappear.")
    }
    
}

// String extension to conform SwiftyMenuDisplayable for defult behavior
extension String: SwiftyMenuDisplayable {
    public var displayableValue: String {
        return self
    }
    
    public var retrivableValue: Any {
        return self
    }
}






////MARK:- Custom DropDown Menu Class
//class dropDownBtn: UIButton {
//
//    var dropView = dropDownView()
//    var height = NSLayoutConstraint()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        self.backgroundColor = UIColor.darkGray
//        dropView = dropDownView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//
//        dropView.translatesAutoresizingMaskIntoConstraints = false
//
//    }
//
//    override func didMoveToSuperview() {
//        self.superview?.addSubview(dropView)
//        self.superview?.bringSubviewToFront(dropView)
//
//        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive         = true
//        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive    = true
//        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive        = true
//        height = dropView.heightAnchor.constraint(equalToConstant: 0)
//    }
//
//    var isOpen = false
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if isOpen == false {
//
//            isOpen = true
//            NSLayoutConstraint.deactivate([self.height])
//
//            if self.dropView.tableView.contentSize.height > 150 {
//            self.height.constant = 150
//            } else {
//                self.height.constant = self.dropView.tableView.contentSize.height
//            }
//
//            NSLayoutConstraint.activate([self.height])
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
//                self.dropView.layoutIfNeeded()
//                self.dropView.center.y += self.dropView.frame.height / 2
//            }, completion: nil)
//
//        } else {
//            isOpen = false
//            NSLayoutConstraint.deactivate([self.height])
//            self.height.constant = 0
//            NSLayoutConstraint.activate([self.height])
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
//                self.dropView.center.y += self.dropView.frame.height / 2
//                self.dropView.layoutIfNeeded()
//            }, completion: nil)
//
//        }
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
////MARK:- Custom View of DropDown Menu Class
//class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
//    var dropDownOptions = [String]()
//    var tableView = UITableView()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        tableView.backgroundColor = UIColor.darkGray
//        self.backgroundColor = UIColor.darkGray
//
//        tableView.delegate                                    = self
//        tableView.dataSource                                  = self
//        tableView.translatesAutoresizingMaskIntoConstraints   = false
//
//        self.addSubview(tableView)
//
//        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive       = true
//        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive     = true
//        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive         = true
//        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive   = true
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dropDownOptions.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = UITableViewCell()
//        cell.textLabel?.text = dropDownOptions[indexPath.row]
//        cell.backgroundColor = UIColor.darkGray
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(dropDownOptions[indexPath.row])
//    }
//
//
//}
