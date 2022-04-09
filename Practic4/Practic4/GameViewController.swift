//
//  GamesViewController.swift
//  Practic4
//
//  Created by Артём on 04.04.2022.
//

import UIKit


class GameViewController: UIViewController {

    
    
    
    @IBOutlet weak var robotButton: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var stoneButton: UIButton!
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    //Метод срабатывает после загрузки Veiw
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
    }
    
    
    func play(sign: Sign)
    {
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
        resetButton.isHidden = false
        
        let result =  sign.getResult(for: computerSign)
        
        switch result {
        case .start:
            reset() // useless
        case .win:
            statusLabel.text = "Победа"
            self.view.backgroundColor = .green
            
        case .lose:
            statusLabel.text = "Вы проиграли :("
            self.view.backgroundColor = .red
            
        case .draw:
            statusLabel.text = "Ничья"
            self.view.backgroundColor = .yellow
            
        }
    }
    
    func reset()
    {
        stoneButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
        self.view.backgroundColor = UIColor.white
        
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
        stoneButton.isEnabled = true
        
    }
    
    // MARK: - IBAction
    
    
    
    @IBAction func stoneButtonPressed(_ sender: Any) {
        play(sign: .stone)
        stoneButton.isEnabled = false
    }
    
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(sign: .scissors)
        scissorsButton.isEnabled = false
        
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(sign: .paper)
        paperButton.isEnabled = false
    }

    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
}

extension UIButton {
    func set(fontSize: CGFloat)
    {
        if let titleLable = titleLabel
        {
            titleLable.font = UIFont(name: titleLable.font.fontName, size: fontSize)
        }
    }
}
