//
//  SignInController.swift
//  FirstPro
//
//  Created by Tarun Meena on 06/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class SignInController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var constraintsContentHeight: NSLayoutConstraint!
    
    var activeField: UITextField?
    var lastOffSet: CGPoint!
    var KeyboardHeight: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        emailField.leftView = UIImageView(image: #imageLiteral(resourceName: "icon-user"))
        // Do any additional setup after loading the view.
        // Observe keyboard change
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // Add touch gesture for contentView
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnTextView(gesture:))))
    }
    
    @objc func returnTextView(gesture: UIGestureRecognizer) {
        guard activeField != nil else {
            return
        }
        
        activeField?.resignFirstResponder()
        activeField = nil
    }
}
// MARK: UITextFieldDelegate
extension SignInController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        lastOffSet = self.scrollView.contentOffset
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeField?.resignFirstResponder()
        activeField = nil
        return true
    }
}

extension SignInController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if KeyboardHeight != nil {
            return
        }
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            KeyboardHeight = keyboardSize.height
            
            // so increase contenftView's height by keyboard height
            UIView.animate(withDuration: 0.3, animations: {
                self.constraintsContentHeight.constant += self.KeyboardHeight
            })
            
            // move if keyboard hide input field
            let distanceToBottom = self.scrollView.frame.size.height - (activeField?.frame.origin.y)! - (activeField?.frame.size.height)!
            let collapseSpace = KeyboardHeight - distanceToBottom
            
            if collapseSpace < 0 {
                // no collapse
                return
            }
            
            // set new offset for scroll view
            UIView.animate(withDuration: 0.3, animations: {
                // scroll to the position above keyboard 10 points
                self.scrollView.contentOffset = CGPoint(x: self.lastOffSet.x, y: collapseSpace + 10)
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.constraintsContentHeight.constant -= self.KeyboardHeight
            
            self.scrollView.contentOffset = self.lastOffSet
        }
        
        KeyboardHeight = nil
    }
}

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}













