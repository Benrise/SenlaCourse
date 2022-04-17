//
//  GameViewController.swift
//  gamesProgrammatically
//
//  Created by Артём on 17.04.2022.
//

import UIKit

class GameViewController: UIViewController {

    let stoneButton = UIButton(type: .system)
    let scissorsButton = UIButton(type: .system)
    let paperButton = UIButton(type: .system)
    let robotButton = UIButton()
    let resetButton = UIButton(type: .system)
    
    let status = UILabel()
    
    let mainStackView = UIStackView()
    let statusStackView = UIStackView()
    let btnStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Game"
        reset()
        
        setupButton(btn: stoneButton, title: "👊🏻", item: -1)
        setupButton(btn: scissorsButton, title: "✌🏻", item: -2)
        setupButton(btn: paperButton, title: "✋🏻", item: -3)
      
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        btnStackView.axis = NSLayoutConstraint.Axis.horizontal
        btnStackView.distribution = .equalSpacing
        btnStackView.alignment = .center
        btnStackView.spacing = 50

        btnStackView.addArrangedSubview(stoneButton)
        btnStackView.addArrangedSubview(scissorsButton)
        btnStackView.addArrangedSubview(paperButton)
        
        mainStackView.axis = NSLayoutConstraint.Axis.vertical
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .center
        
//        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true

        status.text = "Камень, Ножницы, Бумага?"
        status.textAlignment = .center
        statusStackView.spacing = 20
        setupButton(btn: robotButton, title: "🤖", item: 99)
        
        robotButton.set(fontSize:100)
        status.font = status.font.withSize(25)
        
        statusStackView.axis = NSLayoutConstraint.Axis.vertical
        statusStackView.alignment = .center
        
        statusStackView.addArrangedSubview(robotButton)
        statusStackView.addArrangedSubview(status)

        setupButton(btn: resetButton, title: "Играть снова", item: -4)
        resetButton.set(fontSize: 40)
        
        mainStackView.addArrangedSubview(statusStackView)
        mainStackView.addArrangedSubview(btnStackView)
        mainStackView.addArrangedSubview(resetButton)
        
        view.addSubview(mainStackView)
        
        mainStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    func setupButton(btn: UIButton, title: String, item: Int)
    {
        btn.setTitle(title, for: .normal)
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.set(fontSize: 70)
        btn.tag = item
    }
    
    
    @objc func buttonTapped(sender: UIButton)
    {
        if sender.tag == -1
        {
            print("Stone tapped")
            play(sign: .stone)
            stoneButton.isEnabled = false
            
        }
        if sender.tag == -2
        {
            print("Scissors tapped")
            play(sign: .scissors)
            scissorsButton.isEnabled = false
        }
        if sender.tag == -3
        {
            print("Paper tapped")
            play(sign: .paper)
            paperButton.isEnabled = false
        }
        if sender.tag == -4
        {
            print("Reset tapped")
            reset()
        }
    }
    
    
    func play(sign: Sign)
    {
        resetButton.alpha = 1
        
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        switch sign {
        case .stone:
            stoneButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            stoneButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            stoneButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        let result =  sign.getResult(for: computerSign)
        
        switch result {
        case .start:
            reset() // useless
        case .win:
            status.text = "Победа"
            self.view.backgroundColor = .green
            
        case .lose:
            status.text = "Вы проиграли :("
            self.view.backgroundColor = .red
            
        case .draw:
            status.text = "Ничья"
            self.view.backgroundColor = .yellow
            
        }
    }
    
    func reset()
    {
        stoneButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.alpha = 0
        
        view.backgroundColor = UIColor.white
        
        stoneButton.isEnabled = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
    }
    
    
}

extension UIButton {
    func set(fontSize: CGFloat)
    {
        self.titleLabel?.font = self.titleLabel?.font.withSize(fontSize)
    }
}



