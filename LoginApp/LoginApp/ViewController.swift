//
//  ViewController.swift
//  LoginApp
//
//  Created by Quan on 6/18/16.
//  Copyright © 2016 KrishApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var emailTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var result: UILabel!
    
    @IBAction func loginButton(sender: AnyObject) {
        let userText = emailTextField.text!
        let passwordText = passwordTextField.text!
        
        let user = "admin"
        let password = "abc123"
        
        if(userText == user && passwordText == password){
            result.text = "Success!"
        }else if(userText != user && passwordText != password){
            result.text = "Try again, both your username and pasword are incorrect"
        }else if(userText == user){
            result.text = "Try again, password is incorrect"
        }else{
            result.text = "Try again, username is incorrect"
        }
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        
    }
   
    //format border color, curvature, thickness
    func formatBorder(textField:UITextField!){
        let borderColor: UIColor = UIColor.blackColor()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = borderColor.CGColor
        textField.layer.cornerRadius = 5.0
    }
    
    //format icons to attach to text fields
    func formatTextFieldIcons(imageName:String, textField:UITextField!){
        let iconWidth = textField.frame.width/8 + 1
        let iconHeight = textField.frame.height - 3
        
        let imageView = UIImageView()
        let icon = UIImage(named: imageName)
        imageView.image = icon
        imageView.frame = CGRect(x: 0, y: 0, width: iconWidth, height: iconHeight)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        textField.leftViewMode = UITextFieldViewMode.Always
        textField.addSubview(imageView)

    }
    
    //Add padding to text field to prevent overlap with icons
    func paddingTextField(textField:UITextField!){
        let paddingView = UIView(frame: CGRectMake(0, 0, 25, textField.frame.height))
        textField.leftView = paddingView
    }
    
    //close keyboard after hitting return key
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        formatBorder(emailTextField)
        formatBorder(passwordTextField)
        
        let personIcon = "Gender Neutral User-50"
        let lockIcon = "Password-50"
        formatTextFieldIcons(personIcon, textField: emailTextField)
        formatTextFieldIcons(lockIcon, textField: passwordTextField)

        paddingTextField(self.emailTextField)
        paddingTextField(self.passwordTextField)
        
        //Update delegate post return key method
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //close keyboard when touch outside of keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

