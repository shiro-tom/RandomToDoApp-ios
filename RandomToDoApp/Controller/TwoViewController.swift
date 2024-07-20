//
//  TwoViewController.swift
//  RandomToDoApp
//
//  Created by 白石友樹 on 2024/07/18.
//

import UIKit

class TwoViewController: UIViewController {

    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        countDownLabel.isHidden = true
        resultLabel.text = "運命の２択"

        goButton.layer.cornerRadius = goButton.frame.size.width / 2
        goButton.clipsToBounds = true
        
    }
    
    @IBAction func goButton(_ sender: Any) {
        startCountdown()
    }
    
    func startCountdown(){
        countDownLabel.isHidden = false
        var countdown = 3
        countDownLabel.text = "\(countdown)"
        
        startRotatingArrow()
        
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in countdown -= 1
            if countdown > 0 {
                self.countDownLabel.text = "\(countdown)"
            } else {
                timer.invalidate()
                self.randomChoice()
                self.stopRotatingArrow()
            }
        }
    }
    
    func randomChoice(){
        let text1 = textField1.text ?? ""
        let text2 = textField2.text ?? ""
        
        if text1.isEmpty || text2.isEmpty {
            resultLabel.text = "入力してください"
            return
        }
        
        let choices = [text1, text2]
        let randomChoice = choices.randomElement() ?? "エラー"
        resultLabel.text = randomChoice
        
        
    }
    
    func startRotatingArrow(){
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat.pi * 2
        rotation.duration = 1
        rotation.repeatCount = .infinity
        arrowImageView.layer.add(rotation, forKey: "rotationAnimation")
    }
    
 
    
    
    
    
    func stopRotatingArrow(){
        arrowImageView.layer.removeAnimation(forKey: "rotationAnimation")
       
        countDownLabel.isHidden = true
    }
    
    
    
    
    
    
    
    
  

}
