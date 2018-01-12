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
    
    var testInfo = ["Test1", "Test2", "Test3"]
    
    
}
extension AnimationViewController:  UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testInfo.count
        
    }
    

}

extension AnimationViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testInfo[row]
    }
    
    //TODO implement didSelectMethod 
    
}





