//
//  HomeViewController.swift
//  RandomToDoApp
//
//  Created by 白石友樹 on 2024/07/18.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    func startCountdown(){
        var countdown = 3
        resultLabel.text = "\(countdown)"
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in countdown -= 1
            if countdown > 0 {
                self.resultLabel.text = "\(countdown)"
            } else {
                timer.invalidate()
                self.RandomChoice()
            }
        }
    }
    
    func RandomChoice(){
        
        let text1 = textField1.text ?? ""
        let text2 = textField2.text ?? ""
        
        if text1.isEmpty || text2.isEmpty {
            resultLabel.text = "入力してください"
            return
        }
        let choices = [text1, text2]
        let randomeChoice = choices.randomElement() ?? "エラー"
        resultLabel.text = randomeChoice
        
        
    }
    
    
    
    
    @IBAction func goButton(_ sender: Any) {
        
        startCountdown()

    }
    

}
