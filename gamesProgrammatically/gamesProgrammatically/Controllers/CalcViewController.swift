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
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .gray
        return stackView
    }()
    
    let labelsViewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .darkGray
        return stackView
    }()
    
    let functionalViewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        return stackView
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(45)
        label.text = "10+12"
        label.textAlignment = .right
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(45)
        label.text = "12"
        label.textAlignment = .right
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Calculator"
        
        view.addSubview(mainViewStack)
        
        setupMain()
        setupLabels()
        setupFunctional()
    }

    
    func setupMain()
    {
        mainViewStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainViewStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainViewStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainViewStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        mainViewStack.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    func setupLabels()
    {
        labelsViewStack.addArrangedSubview(statusLabel)
        labelsViewStack.addArrangedSubview(resultLabel)
        
        mainViewStack.addArrangedSubview(labelsViewStack)
        
        labelsViewStack.leftAnchor.constraint(equalTo: mainViewStack.leftAnchor).isActive = true
        labelsViewStack.rightAnchor.constraint(equalTo: mainViewStack.rightAnchor).isActive = true
        labelsViewStack.topAnchor.constraint(equalTo: mainViewStack.topAnchor).isActive = true

        labelsViewStack.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        labelsViewStack.heightAnchor.constraint(equalTo: mainViewStack.widthAnchor, multiplier: 1/4).isActive = true
    }
    func setupFunctional()
    {
        mainViewStack.addArrangedSubview(functionalViewStack)
        
        functionalViewStack.leftAnchor.constraint(equalTo: mainViewStack.leftAnchor).isActive = true
        labelsViewStack.rightAnchor.constraint(equalTo: mainViewStack.rightAnchor).isActive = true
        labelsViewStack.topAnchor.constraint(equalTo: labelsViewStack.topAnchor).isActive = true
        
        labelsViewStack.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        labelsViewStack.heightAnchor.constraint(equalTo: mainViewStack.widthAnchor).isActive = true
    }
}


