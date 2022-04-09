//
//  CalcViewController.swift
//  Practic4
//
//  Created by Артём on 04.04.2022.
//

import UIKit

class CalcViewController: UIViewController {

    //Метод срабатывает после загрузки Veiw
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    var status = ""
    var currentOperator = ""
    var pointFlag = false
    
    
    func clearAll()
    {
        status = ""
        calcStatus.text = ""
        calcResult.text = ""
    }
    
    func addToStatus(value: String)
    {
        status = status + value
        calcStatus.text = status
        
        
    }
    
    func formatResult(result: Double) -> String
    {
        if (result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.02f", result)
        }
    }
    
    //header info
    
    @IBOutlet weak var calcStatus: UILabel!
    
    @IBOutlet weak var calcResult: UILabel!
    
    //operations
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any) {
        if (!status.isEmpty)
        {
            status.removeLast()
            calcStatus.text = status
        }
    }
    
    @IBAction func percentTap(_ sender: Any) {
        if (calcStatus.text?.last == ".")
        {
            addToStatus(value: "0")
        }
        if !(calcStatus.text?.last == nil || calcStatus.text?.last == "%")
        {
            addToStatus(value: "%")
        }
    }
    
    @IBAction func divideTap(_ sender: Any) {
        if (calcStatus.text?.last == ".")
        {
            addToStatus(value: "0")
        }
        if !(calcStatus.text?.last == nil || calcStatus.text?.last == "/")
        {
            addToStatus(value: "/")
        }
    }
    
    @IBAction func xTap(_ sender: Any) {
        if (calcStatus.text?.last == ".")
        {
            addToStatus(value: "0")
        }
        if !(calcStatus.text?.last == nil || calcStatus.text?.last == "*")
        {
            addToStatus(value: "*")
        }
    }
    
    
    @IBAction func minusTap(_ sender: Any) {
        if (calcStatus.text?.last == ".")
        {
            addToStatus(value: "0")
        }
        if !(calcStatus.text?.last == nil || calcStatus.text?.last == "-")
        {
            addToStatus(value: "-")
        }
    }
    
    @IBAction func plusTap(_ sender: Any) {
        if (calcStatus.text?.last == ".")
        {
            addToStatus(value: "0")
        }
        if !(calcStatus.text?.last == nil || calcStatus.text?.last == "+")
        {
            addToStatus(value: "+")
        }
    }
    
    @IBAction func equalTap(_ sender: Any) {
        if (calcStatus.text?.last == "+" || calcStatus.text?.last == "*" || calcStatus.text?.last == "/"
            || calcStatus.text?.last == "%" || calcStatus.text?.last == "-")
        {
            return
        }
        if (calcStatus.text?.last == ".")
        {
            addToStatus(value: "0")
        }
        let checkedForPercent = status.replacingOccurrences(of: "%", with: "*0.01*")
        print(checkedForPercent)
        print(" ")
        let expression = NSExpression(format: checkedForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        print(expression)
        print(" ")
        print(result)
        let resultString = formatResult(result: result)
        calcResult.text = resultString
        pointFlag = false
        
    }
    
    //digits
    
    @IBAction func commaTap(_ sender: Any) {
        
        
        if (calcStatus.text?.last == "%" || calcStatus.text?.last == "." || pointFlag)
        {
            return
        }
        if (calcStatus.text == "")
        {
            pointFlag = true
            addToStatus(value: "0.")
        }
        else
        {
            pointFlag = true
            addToStatus(value: ".")
        }
        
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToStatus(value: "0")
    }
    
    
    @IBAction func oneTap(_ sender: Any) {
        addToStatus(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToStatus(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToStatus(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToStatus(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToStatus(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToStatus(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToStatus(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToStatus(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToStatus(value: "9")
    }
    
    
    
}
