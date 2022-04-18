//
//  CalcViewController.swift
//  gamesProgrammatically
//
//  Created by Артём on 17.04.2022.
//

import UIKit

class CalcViewController: UIViewController {
    
    let mainViewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .gray
        
        
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Calculator"
        
        view.addSubview(mainViewStack)
        setupMain()
    }

    
    func setupMain()
    {
        mainViewStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainViewStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainViewStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        
        mainViewStack.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainViewStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.755).isActive = true
        
        
        
        
    }
    
}


