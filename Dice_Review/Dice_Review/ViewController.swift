//
//  ViewController.swift
//  Dice_Review
//
//  Created by 하동훈 on 2021/03/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstDiceImageView: UIImageView!
    @IBOutlet weak var secondDiceImageView: UIImageView!
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let dices = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        firstDiceImageView.image = dices.randomElement()
        secondDiceImageView.image = dices.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

