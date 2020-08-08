//
//  LoginVC.swift
//  InstagramClone
//
//  Created by David on 2020/8/8.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
  
  // MARK: - Properties
  
  let logoContainerView: UIView = {
    let view = UIView()
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
    logoImageView.contentMode = .scaleAspectFill
    view.addSubview(logoImageView)
    logoImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
    logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    view.backgroundColor = UIColor(red: 0/255, green: 120/255, blue: 175/255, alpha: 1)
    return view
  }()
  
  let emailTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Email")
    tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
    return tf
  }()
  
  let passwordTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Password")
    tf.isSecureTextEntry = true
    tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
    return tf
  }()
  
  let loginButton: UIButton = {
    let button = Utilities().loginAndSignUpButton("Login")
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    
    return button
  }()
  
  let dontHaveAccountButton: UIButton = {
    let button = Utilities().attributeButton("Don't have a account", " Sign Up")
    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // background color
    view.backgroundColor = .white
    
    // hide nav bar
    navigationController?.navigationBar.isHidden = true
    
    // white status bar
    navigationController?.navigationBar.barStyle = .black
    
    view.addSubview(logoContainerView)
    logoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
    
    configureViewComponents()
    
    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
  }
  
  // MARK: - Handlers
  
  @objc func handleShowSignUp() {
    let signUpVC = SignUpVC()
    navigationController?.pushViewController(signUpVC, animated: true)
  }
  
  @objc func handleLogin() {
    
    // properties
    guard
      let email = emailTextField.text,
      let password = passwordTextField.text else { return }
    
    // sign user in with email and password
    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
      
      // handle error
      if let error = error {
        print("Unable to sign user in with error", error.localizedDescription)
        return
      }
      
      guard let mainTabVC = UIApplication.shared.keyWindow?.rootViewController as? MainTabVC else { return }
      
      mainTabVC.configureViewControllers()
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  @objc func formValidation() {
    
    // ensures that email and password text fields have text
    guard
      emailTextField.hasText,
      passwordTextField.hasText else {
        
        // handle case for above conditions not met
        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        return
    }
    
    // handle case for conditions were met
    loginButton.isEnabled = true
    loginButton.backgroundColor = UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)
  }
  
  func configureViewComponents() {
    
    let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
    
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.distribution = .fillEqually
    
    view.addSubview(stackView)
    stackView.anchor(top: logoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 140)
  }
}
