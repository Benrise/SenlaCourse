//
//  GameViewController.swift
//  gamesProgrammatically
//
//  Created by Артём on 17.04.2022.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Game"
        
        let stoneButton = UIButton(type: .system)
        let scissorsButton = UIButton(type: .system)
        let paperButton = UIButton(type: .system)
        view.addSubview(setupButton(btn: stoneButton, coordinates: (0, 0), title: "👊🏻"))
        view.addSubview(setupButton(btn: scissorsButton, coordinates: (0, 0), title: "✌🏻"))
        view.addSubview(setupButton(btn: paperButton, coordinates: (0, 0), title: "✋🏻"))
      
        let btnStackVeiw = UIStackView()
        btnStackVeiw.translatesAutoresizingMaskIntoConstraints = false
        btnStackVeiw.axis = NSLayoutConstraint.Axis.horizontal
        btnStackVeiw.distribution = .fillEqually
        btnStackVeiw.alignment = .center
        btnStackVeiw.spacing = 10.0
        
        btnStackVeiw.addArrangedSubview(stoneButton)
        btnStackVeiw.addArrangedSubview(scissorsButton)
        btnStackVeiw.addArrangedSubview(paperButton)
        
        view.addSubview(btnStackVeiw)
        
        btnStackVeiw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        btnStackVeiw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        btnStackVeiw.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        
        
    }
    
    func setupButton(btn: UIButton, coordinates: (x:CGFloat, y:CGFloat), title: String) -> UIButton
    {
//        btn.frame = CGRect(x: coordinates.x, y: coordinates.y, width: 0, height: 0)
        btn.setTitle(title, for: .normal)
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btn.backgroundColor = .black
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(50)
        return btn
    }
    @objc func buttonTapped()
    {
        print("Pressed")
    }
}

