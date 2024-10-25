//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Alexander Korchak on 30.11.2023.
//

import UIKit

final class EqualSquaresViewController: UIViewController {
    
    @Autolayout private var containerView = UIView()
    @Autolayout private var square1 = UIView()
    @Autolayout private var square2 = UIView()
    @Autolayout private var square3 = UIView()
    @Autolayout private var square4 = UIView()
    
    @Autolayout private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Change", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(changeTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {

        view.backgroundColor = .white
        
        containerView.backgroundColor = .lightGray
        
        square1.backgroundColor = .red
        square2.backgroundColor = .blue
        square3.backgroundColor = .orange
        square4.backgroundColor = .green
        
        view.addSubviews([containerView, button])
        containerView.addSubviews([square1, square2, square3, square4])
        
        let spacing: CGFloat = 5
        let squareWidth = (containerView.frame.width - 3 * spacing) / 2
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor),
        
            square1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: spacing),
            square1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: spacing),
            square1.widthAnchor.constraint(equalToConstant: squareWidth),
            square1.heightAnchor.constraint(equalTo: square1.widthAnchor),
            
            square2.topAnchor.constraint(equalTo: containerView.topAnchor, constant: spacing),
            square2.leadingAnchor.constraint(equalTo: square1.trailingAnchor, constant: spacing),
            square2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -spacing),
            square2.widthAnchor.constraint(equalTo: square1.widthAnchor),
            square2.heightAnchor.constraint(equalTo: square2.widthAnchor),
            
            square3.topAnchor.constraint(equalTo: square1.bottomAnchor, constant: spacing),
            square3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: spacing),
            square3.widthAnchor.constraint(equalTo: square1.widthAnchor),
            square3.heightAnchor.constraint(equalTo: square3.widthAnchor),
            square3.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -spacing),
            
            square4.topAnchor.constraint(equalTo: square2.bottomAnchor, constant: spacing),
            square4.leadingAnchor.constraint(equalTo: square3.trailingAnchor, constant: spacing),
            square4.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -spacing),
            square4.widthAnchor.constraint(equalTo: square3.widthAnchor),
            square4.heightAnchor.constraint(equalTo: square4.widthAnchor),
            square4.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -spacing),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func changeTapped(_ sender: UIButton) {
        let value = Double.random(in: 0.1...1)
        let containerSize = containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: value)
        containerSize.isActive = true
    }
}

#Preview {
    EqualSquaresViewController()
}

