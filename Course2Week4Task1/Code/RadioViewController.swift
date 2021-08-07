//
//  RadioViewController.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {
    var portaitOrientation = [NSLayoutConstraint]()
    var albumOrientation = [NSLayoutConstraint]()
    
    
    private lazy var albumPhoto: UIImageView = {
        let image = UIImageView(image: UIImage(named: "img"))
        image.contentScaleFactor = 1
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 0.5
        return progress
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Queen - Cool cat"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.5
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        view.addSubview(albumPhoto)
        view.addSubview(progressBar)
        view.addSubview(label)
        view.addSubview(slider)
        configureConstraints()
        changeOrientation(traitCollection: UIScreen.main.traitCollection)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        changeOrientation(traitCollection: traitCollection)
    }
    
    private func changeOrientation(traitCollection: UITraitCollection){
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular{
            NSLayoutConstraint.deactivate(albumOrientation)
            NSLayoutConstraint.activate(portaitOrientation)
        }else{
            NSLayoutConstraint.deactivate(portaitOrientation)
            NSLayoutConstraint.activate(albumOrientation)
        }
    }
        
    private func configureConstraints(){
        portaitOrientation = [
            albumPhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            albumPhoto.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            albumPhoto.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            albumPhoto.widthAnchor.constraint(equalTo: albumPhoto.heightAnchor, multiplier: 1.0),
            progressBar.topAnchor.constraint(equalTo: albumPhoto.bottomAnchor, constant: 30.0),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            label.topAnchor.constraint(equalTo: progressBar.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            slider.topAnchor.constraint(equalTo: label.bottomAnchor),
            slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            slider.heightAnchor.constraint(equalToConstant: 31)
            
        ]
        albumOrientation = [
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            albumPhoto.heightAnchor.constraint(lessThanOrEqualToConstant: 307),
            albumPhoto.topAnchor.constraint(equalTo: progressBar.topAnchor, constant: 16.0),
            albumPhoto.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            albumPhoto.widthAnchor.constraint(equalTo: albumPhoto.heightAnchor, multiplier: 1.0),
            label.topAnchor.constraint(equalTo: progressBar.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: albumPhoto.trailingAnchor, constant: 16.0),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            slider.topAnchor.constraint(equalTo: label.bottomAnchor),
            slider.topAnchor.constraint(equalTo: albumPhoto.bottomAnchor, constant: 16.0),
            slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            slider.heightAnchor.constraint(equalToConstant: 31)
            
        ]
    }
}
