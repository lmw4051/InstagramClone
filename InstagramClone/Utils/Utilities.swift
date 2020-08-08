//
//  Utilities.swift
//  InstagramClone
//
//  Created by David on 2020/8/8.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class Utilities {
  func textField(withPlaceholder placeholder: String) -> UITextField {
    let tf = UITextField()
    tf.placeholder = placeholder
    tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
    tf.borderStyle = .roundedRect
    tf.font = UIFont.systemFont(ofSize: 14)
    return tf
  }
  
  func loginAndSignUpButton(_ title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
    button.isEnabled = false
    button.layer.cornerRadius = 5
    return button
  }
  
  func attributeButton(_ firstPart: String, _ secondPart: String) -> UIButton {
    let button = UIButton(type: .system)
    
    let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
  }
}
