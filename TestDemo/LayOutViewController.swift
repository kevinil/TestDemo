//
//  LayOutViewController.swift
//  TestDemo
//
//  Created by 三斗 on 16/4/13.
//  Copyright © 2016年 com.streamind. All rights reserved.
//

import UIKit

class LayOutViewController: UIViewController {
  
  @IBOutlet weak var square: UIView!

  @IBOutlet weak var widthLayOut: NSLayoutConstraint!
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    UIView.animateWithDuration(5, delay: 0, options: .CurveEaseInOut, animations: {
      self.widthLayOut.constant = 200
      self.view.layoutIfNeeded()
      }, completion: nil)
  }
  
  
}
