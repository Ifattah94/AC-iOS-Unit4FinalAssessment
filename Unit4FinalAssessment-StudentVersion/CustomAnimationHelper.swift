//
//  CustomAnimationHelper.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
class CustomAnimationsHelper {
    private init() {}
    static let manager = CustomAnimationsHelper()
    static private var savedAnimations = [CustomAnimation]()
    
    static func setNewAnimation(animation: CustomAnimation) {
        self.savedAnimations.append(animation)
    }
    
    static func getSavedAnimations() -> [CustomAnimation] {
        return savedAnimations
    }
    
    //TODO implement file manager
    
}
