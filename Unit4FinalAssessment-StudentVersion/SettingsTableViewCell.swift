//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    var property: AnimationProperty? {
        didSet {
            setCurrentValues(with: property!)
        }
    }
    
    
    var currentValuesForPropertiesDict: [String: Double] = [:] {
        didSet {
            
        }
    }
    
    
    
    
    
    
    public func setCurrentValues(with property: AnimationProperty) {
        switch property.name {
        case .widthMultiplier :
            currentValuesForPropertiesDict.updateValue(stepper.value, forKey: property.name.rawValue)
        case.heightMultiplier :
            currentValuesForPropertiesDict.updateValue(stepper.value, forKey: property.name.rawValue)
        case.horizontalOffset :
            currentValuesForPropertiesDict.updateValue(stepper.value, forKey: property.name.rawValue)
        case.verticalOffset :
            currentValuesForPropertiesDict.updateValue(stepper.value, forKey: property.name.rawValue)
        case .rotations :
            currentValuesForPropertiesDict.updateValue(stepper.value, forKey: property.name.rawValue)
        }
    }
    
    
    lazy var propertyLabel: UILabel = {
        let label = UILabel()
        //label.text = "Test"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        return stepper
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SettingsCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
        setupStepperValues()
        
    }
    
    @objc func step() {
        if let property = property {
            setCurrentValues(with: property)
            if let val = currentValuesForPropertiesDict[property.name.rawValue] {
                propertyLabel.text = property.name.rawValue + " " + val.description
            }
        }
        
    }
    
    
    private func setupStepper() {
        
    }
    private func setupViews() {
        setupPropertyLabel()
        setupStepper()
    }
    
    private func setupPropertyLabel() {
        addSubview(propertyLabel)
        propertyLabel.translatesAutoresizingMaskIntoConstraints = false
        propertyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        propertyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
     
    }
    
    private func setupStepperValues() {
        if let property = property {
            stepper.minimumValue = property.stepperMin
            stepper.maximumValue = property.stepperMax
            stepper.stepValue = property.stepperIncrement
            stepper.addTarget(self, action: #selector(step), for: .valueChanged)
    }
        addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        stepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
  
    
   
    

}
