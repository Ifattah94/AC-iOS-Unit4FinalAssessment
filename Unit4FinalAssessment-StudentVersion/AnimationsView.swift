//
//  AnimationsView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationsView: UIView {

    lazy var snowmanImageView: UIImageView = {
       let iv = UIImageView()
       iv.contentMode = .scaleAspectFit
       iv.image = #imageLiteral(resourceName: "snowman")
       return iv
    }()
    
    lazy var animationsPickerView: UIPickerView = {
        let pv = UIPickerView()
        return pv
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icons8-play-button-30"), for: .normal)
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
    
    private func setupViews() {
        setupSnowmanImageView()
        setupAnimationsPickerView()
        setupPlayButton()
    }
    
    private func setupSnowmanImageView() {
        addSubview(snowmanImageView)
        snowmanImageView.translatesAutoresizingMaskIntoConstraints = false
        snowmanImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        snowmanImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        snowmanImageView.widthAnchor.constraint(equalTo: snowmanImageView.heightAnchor).isActive = true
        snowmanImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -70).isActive = true
    }
    
    private func setupAnimationsPickerView() {
        addSubview(animationsPickerView)
        animationsPickerView.translatesAutoresizingMaskIntoConstraints = false
        animationsPickerView.topAnchor.constraint(equalTo: snowmanImageView.bottomAnchor, constant: 12).isActive = true
        animationsPickerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        animationsPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        snowmanImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
    private func setupPlayButton() {
        addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: animationsPickerView.bottomAnchor, constant: 8).isActive = true
        playButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    
}
