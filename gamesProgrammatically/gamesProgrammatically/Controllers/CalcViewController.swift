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
    
    let funcViewStack1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        return stackView
    }()
    let funcViewStack2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .blue
        return stackView
    }()
    let funcViewStack3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .purple
        return stackView
    }()
    let funcViewStack4: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .green
        return stackView
    }()
    let funcViewStack5: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    let zeroViewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
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
        
        labelsViewStack.heightAnchor.constraint(equalTo: mainViewStack.widthAnchor, multiplier: 1/4).isActive = true
    }
    func setupFunctional()
    {
        mainViewStack.addArrangedSubview(functionalViewStack)
        

        
        functionalViewStack.addArrangedSubview(funcViewStack1)
        functionalViewStack.addArrangedSubview(funcViewStack2)
        functionalViewStack.addArrangedSubview(funcViewStack3)
        functionalViewStack.addArrangedSubview(funcViewStack4)
        
        setupButton("AC", 1)
        setupButton("⌫", 1)
        setupButton("%", 1)
        setupButton("/", 1)
        
        setupButton("7", 2)
        setupButton("8", 2)
        setupButton("9", 2)
        setupButton("X", 2)
        
        setupButton("4", 3)
        setupButton("5", 3)
        setupButton("6", 3)
        setupButton("-", 3)
        
        setupButton("1", 4)
        setupButton("2", 4)
        setupButton("3", 4)
        setupButton("+", 4)
        
        
    }
    
    func setupButton(_ title: String, _ tag: Int)
    {
        
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setFontSize(fontSize: 30)
        switch (tag)
        {
        case 1:
            funcViewStack1.addArrangedSubview(button)
        case 2:
            funcViewStack2.addArrangedSubview(button)
        case 3:
            funcViewStack3.addArrangedSubview(button)
        case 4:
            funcViewStack4.addArrangedSubview(button)
        default:
            return
        }
    }
}


