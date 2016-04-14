//
//  ViewController.swift
//  TestDemo
//
//  Created by 三斗 on 16/4/13.
//  Copyright © 2016年 com.streamind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var askButton : UIButton!
    
    var hasClicked = false
    
    var cornerAnim = CABasicAnimation()
    
    /**
     view override
     */
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createAnim()
        createButton()
    }
    
    override func viewWillLayoutSubviews()
    {
        askButton.frame =
            hasClicked ?
                CGRect(x: view.center.x - BigWidth / 2, y: view.center.y - BigHeight / 2, width: BigWidth, height: BigHeight) :
                CGRect(x: view.center.x - LittleWidth / 2, y: view.center.y - LittleHeight / 2, width: LittleWidth, height: LittleHeight)
    }
    
    /**
     create components
     */
    
    func createButton()
    {
        askButton = UIButton(type: .System)
        askButton.setTitle("click", forState: .Normal)
        askButton.frame = CGRect(x: view.center.x - LittleWidth / 2, y: view.center.y - LittleHeight / 2, width: LittleWidth, height: LittleHeight)
        askButton.addTarget(self, action: #selector(ViewController.click), forControlEvents: .TouchUpInside)
        askButton.layer.masksToBounds = true
        askButton.layer.cornerRadius = askButton.frame.height/2
        askButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        askButton.layer.borderWidth = 2
        askButton.tintColor = UIColor.whiteColor()
        
        view.backgroundColor = UIColor.darkGrayColor()
        view.addSubview(askButton)
    }
    
    func createAnim()
    {
        cornerAnim.keyPath = "cornerRadius"
        cornerAnim.duration = 2
        cornerAnim.fillMode = kCAFillModeForwards
        cornerAnim.delegate = self
        cornerAnim.removedOnCompletion = false
    }
    
    
    /**
     
     enum for style
     
     
     - Little: 小精灵
     
     - Big:    大脸怪
     
     */
    
    enum TransformSize {
        case Little, Big
    }
    
    /**
     function flow
     */
    
    func click()
    {
        hasClicked = !hasClicked
        hasClicked ? transFrame(to: .Big) : transFrame(to: .Little)
    }
    
    func transFrame(to size: TransformSize)
    {
        var frame = CGRectZero
        switch size {
        case .Little:
            changeCorner(from: 40, to: 20)
            frame = CGRect(x: view.center.x - LittleWidth / 2, y: view.center.y - LittleHeight / 2, width: LittleWidth, height: LittleHeight)
        case .Big:
            changeCorner(from: 20, to: 40)
            frame = CGRect(x: view.center.x - BigWidth / 2, y: view.center.y - BigHeight / 2, width: BigWidth, height: BigHeight)
        }
        UIView.animateWithDuration(2, delay: 0, options: .CurveEaseInOut, animations: { 
            self.askButton.frame = frame
            }, completion: nil)
        
    }
    
    func changeCorner(from start: CGFloat, to end: CGFloat)
    {
        cornerAnim.fromValue = start
        cornerAnim.toValue = end
        askButton.layer.removeAllAnimations()
        askButton.layer.addAnimation(cornerAnim, forKey: "cornerRadius")
    }

    
}

private let LittleWidth : CGFloat = 100
private let LittleHeight : CGFloat = 40
private let BigWidth : CGFloat = 150
private let BigHeight : CGFloat = 80


