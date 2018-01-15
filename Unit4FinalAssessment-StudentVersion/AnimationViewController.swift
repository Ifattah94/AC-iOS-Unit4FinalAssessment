//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    let animationsView = AnimationsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.7, alpha: 1.0)
        view.addSubview(animationsView)
        animationsView.animationsPickerView.dataSource = self
        animationsView.animationsPickerView.delegate = self 
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animations = DataPersistenceHelper.manager.getFavoriteAnimations()
        
    }
    
    var animations = [DataPersistenceHelper.UserAnimation]() {
        didSet {
            animationsView.animationsPickerView.reloadAllComponents()
        }
    }
    func runAnimation() {
        guard let loadedAnimation = selectedAnimation else { return }
        
        Animation.doAnimation(animation: loadedAnimation.animation, on: animationsView.snowmanImageView)
        
        
    }
    
    var selectedAnimation: DataPersistenceHelper.UserAnimation?
}
extension AnimationViewController:  UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.count
        
    }
    

}

extension AnimationViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animations[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAnimation = animations[row]
        runAnimation()
        
    }
    
}





