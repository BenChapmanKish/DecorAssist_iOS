//
//  FirstViewController.swift
//  DecorAssist
//
//  Created by Ben Chapman-Kish on 2018-01-28.
//  Copyright © 2018 Big Poppa Productions. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        self.nameField.delegate = self
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        self.nameField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        let urlString = "https://flask-decorassistant.herokuapp.com/login"
        let parameters: Parameters = ["username": self.usernameField.text!, "password": self.passwordField.text!]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON {
            response in
            switch response.result {
            case .failure(let error):
                self.responseLabel.text = error.localizedDescription;
                return
                
            case .success(let data):
                // First make sure you got back a dictionary if that's what you expect
                guard let json = data as? [String : AnyObject] else {
                    return
                }
                
                // Then make sure you get the actual key/value types you expect
                guard let message = json["message"] as? String else {
                    return
                }
                
                self.responseLabel.text = message;
            }
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let urlString = "https://flask-decorassistant.herokuapp.com/signup"
        let parameters: Parameters = ["username": self.usernameField.text!, "password": self.passwordField.text!, "name": self.nameField.text!]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON {
            response in
            switch response.result {
            case .failure(let error):
                self.responseLabel.text = error.localizedDescription;
                return
                
            case .success(let data):
                // First make sure you got back a dictionary if that's what you expect
                guard let json = data as? [String : AnyObject] else {
                    return
                }
                
                // Then make sure you get the actual key/value types you expect
                guard let message = json["message"] as? String else {
                    return
                }
                
                self.responseLabel.text = message;
            }
        }
    }
    
}

