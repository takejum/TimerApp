//
//  ViewController.swift
//  FakeIGLoginApp
//
//  Created by Jumpei Takeshita on 2020/03/13.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting up UITextField's protocol to each of textfield
        idTextField.delegate = self
        pwTextField.delegate = self
        
    }

    @IBAction func loginButton(_ sender: Any) {
        
        //change image in logoImageView to another one
        logoImageView.image = UIImage(named: "loginOK")
        
        //what is typed in each textField will be reflected to each label down below
        usernameLabel.text = idTextField.text
        passwordLabel.text = pwTextField.text
        
        //remove keyboard when loginButton is pressed
        //idTextField.endEditing(true)
        //pwTextField.endEditing(true)
        
    }
    
    //move keyboard away when return button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //move keyboard away when the screen other than keyboard is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


