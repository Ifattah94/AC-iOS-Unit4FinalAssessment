//
//  Animation.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/15/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
struct Animation: Codable {
    var widthMultiplier: Double
    var heightMultiplier: Double
    
    var horizontalOffset: Double
    var verticalOffset: Double
    
    var duration: Double
    var flips: Double
    var opacity: Double
    var curvature: Double
    
    static func doAnimation(animation: Animation, on image: UIImageView) {
        
        image.layer.masksToBounds = true
        
        
        UIView.animate(withDuration: animation.duration, animations: {
            
            image.transform = CGAffineTransform(scaleX: CGFloat(animation.widthMultiplier), y: CGFloat(animation.heightMultiplier)).translatedBy(x: CGFloat(animation.horizontalOffset), y: CGFloat(animation.verticalOffset))
            image.layer.opacity = Float(animation.opacity)
            
        })
        
        let basicAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = CGFloat.pi * CGFloat(animation.flips * 2)
        
        basicAnimation.fromValue = 0
        basicAnimation.byValue = angleRadian
        basicAnimation.duration = animation.duration
        image.layer.add(basicAnimation, forKey: nil)
        
        
        let basicAnimation2 = CABasicAnimation(keyPath: "cornerRadius")
        basicAnimation2.fromValue = 0
        basicAnimation2.toValue = animation.curvature
        basicAnimation2.duration = animation.duration
        image.layer.add(basicAnimation2, forKey: nil)
        image.layer.cornerRadius = CGFloat(animation.curvature)
        
    }
}
