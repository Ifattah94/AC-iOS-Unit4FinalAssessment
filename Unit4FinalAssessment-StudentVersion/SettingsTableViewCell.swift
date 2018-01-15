//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    lazy var propertyLabel: UILabel = {
        let label = UILabel()
        //label.text = "Test"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(step), for: .valueChanged)
        var section = 0
        var row = 0
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
        
        
    }
    
    @objc func step() {
        valueLabel.text = stepper.value.description

        
    }
    
    
    private func setupStepper() {
        addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        stepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    private func setupViews() {
        setupPropertyLabel()
        setupStepper()
        setupValueLabel()
    }
    
    private func setupPropertyLabel() {
        addSubview(propertyLabel)
        propertyLabel.translatesAutoresizingMaskIntoConstraints = false
        propertyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        propertyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
     
    }
    
    private func setupValueLabel() {
        addSubview(valueLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            valueLabel.leadingAnchor.constraint(equalTo: propertyLabel.trailingAnchor, constant: 8),
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        
        
        
    }
    

}
