//
//  MessageNotificationView.swift
//  InstagramClone
//
//  Created by David on 2020/8/8.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class MessageNotificationView: UIView {
  
  // MARK: - Properties
  
  var notificationLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .red
    
    addSubview(notificationLabel)
    notificationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    notificationLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
