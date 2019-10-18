//
//  ViewController.swift
//  keyboardHandlingLab
//
//  Created by Phoenix McKnight on 10/16/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   lazy var welcomeLabel:UILabel = {
    let label = UILabel(text: "Proceed with login")
    label.font = UIFont(name: "Arial", size: 18)
    return label
    }()
     
    lazy var customImage:UIImageView = {
        let ci = UIImageView()
        ci.image = UIImage(named: "maxresdefault")
      return ci
    }()
    
    
   lazy var userName:UILabel  = {
    let label = UILabel(text:"User Name")

        return label
    }()
    
    lazy var passWord:UILabel  = {
        let label = UILabel(text: "Password")
        
        return label
      }()
    
    lazy var userNameTextField:UITextField = {
        let tf = UITextField(placeholder: "user name")
        tf.delegate = self
        return tf
    }()
    lazy var passWordTextField:UITextField = {
           let tf = UITextField(placeholder: "password")
        tf.delegate = self
        
           return tf
       }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .red
      //  button.addTarget(self, action: #selector(), for: .touchUpInside)
        return button
    }()
    lazy var forgotPassword:UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Login?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .italicSystemFont(ofSize: 12)
        //button.addTarget(self, action: #selector(keyboardWillShow(_:)), for: .touchUpInside)
        return button
       }()
    lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
       scroll.contentInset = UIEdgeInsets(top: 150, left: 0, bottom: 0, right: 0)
     //   scroll.contentOffset = CGPoint(x: 0, y: -500)
        scroll.backgroundColor = .blue
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
   
    var keyboardHeight = CGFloat()
    
    lazy var myViewCenterYConstraint: NSLayoutConstraint = {
        self.customImage.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor,constant: -300)
    }()
 
    
    func checkKeyboardHeight() { NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil) }
    
    
  
    @objc func moveKeysUp(value:CGFloat) {
        myViewCenterYConstraint.isActive = false
        myViewCenterYConstraint = customImage.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor,constant: -300 - value)
        myViewCenterYConstraint.isActive = true
    }
   
    @objc func moveKeysDown() {
          myViewCenterYConstraint.isActive = false
                 myViewCenterYConstraint = customImage.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor,constant: -300)
                 myViewCenterYConstraint.isActive = true
       }
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkKeyboardHeight()
      //  view.backgroundColor =  .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
addSubviews()
        scrollViewConstraints()
        
       imageViewConstraints()
        welcomeLabelConstraints()
        usernameLabelConstraint()
        usernameTextFieldConstraints()
        passwordConstraints()
        passwordTextFieldConstraints()
        loginButtonConstraints()
        forgotPasswordConstraints()
      //  checkKeyboardHeight()
    }
        func addSubviews() {
            
            view.addSubview(scrollView)
            scrollView.addSubview(welcomeLabel)
            scrollView.addSubview(customImage)
            scrollView.addSubview(userName)
            scrollView.addSubview(passWord)
              scrollView.addSubview(userNameTextField)
            scrollView.addSubview(passWordTextField)
             scrollView.addSubview(loginButton)
            scrollView.addSubview(forgotPassword)
        }
    @objc func keyboardWillShow(_ notification: NSNotification) {
 if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    
    self.keyboardHeight = keyboardRect.height

    moveKeysUp(value: keyboardRect.height)
 }
    }
    func scrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor), scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor), scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor), scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)])
       
    }
    func welcomeLabelConstraints() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ welcomeLabel.topAnchor.constraint(equalTo: customImage.bottomAnchor,constant: 50),welcomeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)])
    }
    func imageViewConstraints() {
        self.customImage.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
                        customImage.heightAnchor.constraint(equalToConstant: 250),
                        customImage.widthAnchor.constraint(equalToConstant: 250),
                        customImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),myViewCenterYConstraint
                       // customImage.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: -300)
                        ])
    }
    func usernameLabelConstraint() {
        self.userName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([userName.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 50),userName.centerXAnchor.constraint(equalTo: welcomeLabel.centerXAnchor) ])
    }
    func usernameTextFieldConstraints() {
        self.userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([userNameTextField.topAnchor.constraint(equalTo: userName.bottomAnchor,constant: 10),userNameTextField.leadingAnchor.constraint(equalTo: self.userName.leadingAnchor),userNameTextField.widthAnchor.constraint(equalToConstant: 180) ])
    }
    func passwordConstraints() {
        self.passWord.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([passWord.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor,constant: 25),passWord.leadingAnchor.constraint(equalTo: self.userName.leadingAnchor) ])
    }
    func passwordTextFieldConstraints() {
        self.passWordTextField.translatesAutoresizingMaskIntoConstraints = false
              NSLayoutConstraint.activate([passWordTextField.topAnchor.constraint(equalTo: passWord.bottomAnchor,constant: 10),passWordTextField.leadingAnchor.constraint(equalTo: self.userName.leadingAnchor),passWordTextField.widthAnchor.constraint(equalToConstant: 180) ])
    }
    func loginButtonConstraints() {
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
                     NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor,constant: 150),loginButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),loginButton.widthAnchor.constraint(equalToConstant: 180) ])
    }
    func forgotPasswordConstraints() {
        self.forgotPassword.translatesAutoresizingMaskIntoConstraints = false
                            NSLayoutConstraint.activate([forgotPassword.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 10),forgotPassword.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),forgotPassword.widthAnchor.constraint(equalToConstant: 100) ])
    }
    
}


extension UILabel {
    public convenience init(text:String) {
    self.init()
        self.text = text
        self.textColor = .black
       
        self.font = UIFont(name: "Arial", size: 14)
        
    
}
}
extension UITextField:UITextFieldDelegate {
    public convenience init(placeholder:String) {
    self.init()
        self.borderStyle = .line
        self.textColor = .black
        
        
       
    }
}
extension ViewController:UITextFieldDelegate {
   
               func textFieldDidEndEditing(_ textField: UITextField) {
                moveKeysDown()
               }
               func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                   print("GO")
                   textField.resignFirstResponder()
                   return true
               }
}
