//
//  ResultViewController.swift
//  CollecationViewTest
//
//  Created by Abdullah on 02/10/1446 AH.
//

import UIKit

class ResultViewController: UIViewController
{

    var GameResult : GameInfo!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblNumberOfQuesation: UILabel!
    @IBOutlet weak var lblLevel: UILabel!
    @IBOutlet weak var lblOperation: UILabel!
    @IBOutlet weak var CorrectAnswer: UILabel!
    @IBOutlet weak var lblWrongAnswer: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Load()
    }
    
    @IBAction func btnRestart(_ sender: Any)
    {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func Load()
    {
        lblOperation.text = GameResult.OperationText
        lblNumberOfQuesation.text =  "\(GameResult.NumberOfQuestions)"
        CorrectAnswer.text = "\(GameResult.CorrectAnswer)"
        lblWrongAnswer.text = "\(GameResult.WrongAnswer)"
        lblResult.text = "\(GameResult.CorrectAnswer) out of \(GameResult.NumberOfQuestions)"
    }
}


