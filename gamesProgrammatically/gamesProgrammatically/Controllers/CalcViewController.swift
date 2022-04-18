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
        return stackView
    }()
    
    let labelsViewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let functionalViewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let funcViewStack1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    let funcViewStack2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    let funcViewStack3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    let funcViewStack4: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    let funcViewStack5: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let zeroViewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let commaEqualViewStack: UIStackView =
    {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "10+12"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 45.0)
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()

        label.text = "12"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 45.0)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Calculator"
        
        view.addSubview(mainViewStack)
        
        setupMain()
        setupLabels()
        setupFunctional()
        clearAll()
    }
    
    var status = ""
    var currentOperator = ""
    var pointFlag = false
    
    func clearAll()
    {
        status = ""
        statusLabel.text = ""
        resultLabel.text = ""
        pointFlag = false
    }
    
    
    func addToStatus(value: String)
    {
        status = status + value
        statusLabel.text = status
    }
    
    func formatResult(result: Double) -> String
    {
        if (result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.00f", result)
        }
        else
        {
            return String(format: "%.02f", result)
        }
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
        
        labelsViewStack.heightAnchor.constraint(equalTo: mainViewStack.widthAnchor, multiplier: 1.5/4).isActive = true
    }
    func setupFunctional()
    {
        mainViewStack.addArrangedSubview(functionalViewStack)
        
        
        
        functionalViewStack.addArrangedSubview(funcViewStack1)
        functionalViewStack.addArrangedSubview(funcViewStack2)
        functionalViewStack.addArrangedSubview(funcViewStack3)
        functionalViewStack.addArrangedSubview(funcViewStack4)
        
        funcViewStack5.addArrangedSubview(zeroViewStack)
        funcViewStack5.addArrangedSubview(commaEqualViewStack)
        functionalViewStack.addArrangedSubview(funcViewStack5)
        
        
        setupButton("AC", 1, .systemGray, tag: -1)
        setupButton("⌫", 1,  .systemGray, tag: -2)
        setupButton("%", 1,  .systemGray, tag: -3)
        setupButton("/", 1,  .systemOrange, tag: -4)
        
        setupButton("7", 2, .white, tag: 7)
        setupButton("8", 2, .white, tag: 8)
        setupButton("9", 2, .white, tag: 9)
        setupButton("X", 2, .systemOrange, tag: -5)
        
        setupButton("4", 3,.white, tag:4)
        setupButton("5", 3,.white, tag:5)
        setupButton("6", 3,.white, tag:6)
        setupButton("-", 3, .systemOrange,tag:-6)
        
        setupButton("1", 4,.white, tag: 1)
        setupButton("2", 4,.white, tag: 2)
        setupButton("3", 4,.white, tag: 3)
        setupButton("+", 4, .systemOrange, tag: -7)
        
        setupButton("0", 5,.white, tag: 0)
        setupButton(",", 5,.white, tag: -8)
        setupButton("=", 5,.systemOrange, tag: -9)
        
        
    }
    
    func setupButton(_ title: String, _ row: Int, _ color: UIColor, tag: Int)
    {
        
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setFontSize(fontSize: 30)
        button.backgroundColor = color
        button.setTitleColor(UIColor.black, for: .normal)
        button.tag = tag
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        switch (row)
        {
        case 1:
            funcViewStack1.addArrangedSubview(button)
        case 2:
            funcViewStack2.addArrangedSubview(button)
        case 3:
            funcViewStack3.addArrangedSubview(button)
        case 4:
            funcViewStack4.addArrangedSubview(button)
        case 5:
            if (title == "0")
            {
                zeroViewStack.addArrangedSubview(button)
            }
            else if (title == ",")
            {
                commaEqualViewStack.addArrangedSubview(button)
            }
            else if (title == "=")
            {
                commaEqualViewStack.addArrangedSubview(button)
            }
        default:
            return
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        
        switch (sender.tag)
        {
            
        case 0:
            addToStatus(value: "0")
        case 1:
            addToStatus(value: "1")
        case 2:
            addToStatus(value: "2")
        case 3:
            addToStatus(value: "3")
        case 4:
            addToStatus(value: "4")
        case 5:
            addToStatus(value: "5")
        case 6:
            addToStatus(value: "6")
        case 7:
            addToStatus(value: "7")
        case 8:
            addToStatus(value: "8")
        case 9:
            addToStatus(value: "9")
            
        case -1:
            clearAll()
            
        case -2:
            if (!status.isEmpty)
            {
                status.removeLast()
                statusLabel.text = status
            }
        case -3:
            if (statusLabel.text?.last == "+" || statusLabel.text?.last == "*" || statusLabel.text?.last == "/"
                || statusLabel.text?.last == "%" || statusLabel.text?.last == "-" || statusLabel.text?.last == nil)
            {
                return
            }
            if (statusLabel.text?.last == ".")
            {
                addToStatus(value: "0")
            }
            if !(statusLabel.text?.last == nil || statusLabel.text?.last == "%")
            {
                addToStatus(value: "%")
            }
            pointFlag = false
            
        case -4:
            if (statusLabel.text?.last == "+" || statusLabel.text?.last == "*" || statusLabel.text?.last == "/"
                || statusLabel.text?.last == "%" || statusLabel.text?.last == "-" || statusLabel.text?.last == nil)
            {
                return
            }
            if (statusLabel.text?.last == ".")
            {
                addToStatus(value: "0")
            }
            if !(statusLabel.text?.last == nil || statusLabel.text?.last == "/")
            {
                addToStatus(value: "/")
            }
            pointFlag = false
            
        case -5:
            if (statusLabel.text?.last == "+" || statusLabel.text?.last == "*" || statusLabel.text?.last == "/"
                || statusLabel.text?.last == "%" || statusLabel.text?.last == "-" || statusLabel.text?.last == nil)
            {
                return
            }
            if (statusLabel.text?.last == ".")
            {
                addToStatus(value: "0")
            }
            if !(statusLabel.text?.last == nil || statusLabel.text?.last == "*")
            {
                addToStatus(value: "*")
            }
            pointFlag = false
            
        case -6:
            if (statusLabel.text?.last == "+" || statusLabel.text?.last == "*" || statusLabel.text?.last == "/"
                || statusLabel.text?.last == "%" || statusLabel.text?.last == "-" || statusLabel.text?.last == nil)
            {
                return
            }
            if (statusLabel.text?.last == ".")
            {
                addToStatus(value: "0")
            }
            if !(statusLabel.text?.last == nil || statusLabel.text?.last == "-")
            {
                addToStatus(value: "-")
            }
            pointFlag = false
            
        case -7:
            if (statusLabel.text?.last == "+" || statusLabel.text?.last == "*" || statusLabel.text?.last == "/"
                || statusLabel.text?.last == "%" || statusLabel.text?.last == "-" || statusLabel.text?.last == nil)
            {
                return
            }
            if (statusLabel.text?.last == ".")
            {
                addToStatus(value: "0")
            }
            if !(statusLabel.text?.last == nil || statusLabel.text?.last == "+")
            {
                addToStatus(value: "+")
            }
            pointFlag = false
            
        case -8:
            if (statusLabel.text?.last == "%" || statusLabel.text?.last == "." || pointFlag || statusLabel.text?.last == "*" ||
                statusLabel.text?.last == "/" || statusLabel.text?.last == "+" || statusLabel.text?.last == "-")
            {
                return
            }
            if (statusLabel.text == "")
            {
                pointFlag = true
                addToStatus(value: "0.")
            }
            else
            {
                pointFlag = true
                addToStatus(value: ".")
            }
            
        case -9:
            if (statusLabel.text?.last == "+" || statusLabel.text?.last == "*" || statusLabel.text?.last == "/"
                || statusLabel.text?.last == "%" || statusLabel.text?.last == "-" || statusLabel.text?.last == nil)
            {
                return
            }
            if (statusLabel.text?.last == ".")
            {
                addToStatus(value: "0")
            }
            if (status.contains("/") && !status.contains("."))
            {
                addToStatus(value: ".0")
            }
            let checkedForPercent = status.replacingOccurrences(of: "%", with: "*0.01*")
            let expression = NSExpression(format: checkedForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            resultLabel.text = resultString
            pointFlag = false
            
        default:
            return
        }
        
        
    }
    
}


