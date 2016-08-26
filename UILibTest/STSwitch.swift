//
//  SwitchCustom2.swift
//  SkillTrackerComponent
//
//  Created by Danny Le on 23/6/16.
//  Copyright © 2016 Danny Le. All rights reserved.
//

import UIKit

class STSwitch: UIView {
    var isOnColor: UIColor?
    var isOffColor: UIColor?
    var isOn: Bool!
    var isCorner: Bool = true
    var padding: CGFloat = 3
    //-------
    var button: UIButton!
    var view: UIView!

    override func drawRect(rect: CGRect) {
        isOnColor = UIColor(red: 18.0/255.0, green: 77.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        isOffColor = UIColor(red: 196.0/255.0, green: 197.0/255.0, blue: 198.0/255.0, alpha: 1.0)
        isOn = false
        
        // Set corner for view : default is true
    
        if (isCorner == true){
            self.layer.cornerRadius = 6
            self.layer.masksToBounds = true
        }
        
        view = UIView(frame: CGRectMake(padding, padding, self.bounds.size.width / 2 - padding, self.bounds.size.height - (padding * 2)))
        view.backgroundColor = isOffColor
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        self.addSubview(view)
        
        
        //------
        button = UIButton(frame: CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height))
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        self.addSubview(button)
        button.addTarget(self, action: #selector(toggleSwitch), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func toggleSwitch() {
        onOrOff(!isOn)
    }
    
    func onOrOff(off : Bool){
        isOn = off
        
        UIView.animateWithDuration(0.4,
                                   delay: 0.0,
                                   usingSpringWithDamping: 0.8,
                                   initialSpringVelocity: 14.0,
                                   options: UIViewAnimationOptions.CurveEaseOut,
                                   animations: { () -> Void in
                                    self.view.frame.origin.x += (self.frame.size.width / 2 - self.padding) * (off ? 1 : -1)
                                    },
                                   completion: nil)
        animationColor(!isOn)
    }
    
    func animationColor(off: Bool) {
        UIView.transitionWithView(self.view,
                                  duration: 0.4,
                                  options: [UIViewAnimationOptions.CurveEaseOut, UIViewAnimationOptions.TransitionCrossDissolve, UIViewAnimationOptions.BeginFromCurrentState],
                                  animations: { () -> Void in
                                    self.view.backgroundColor = off ? self.isOffColor : self.isOnColor
                                    },
                                  completion: nil)
    }
}
