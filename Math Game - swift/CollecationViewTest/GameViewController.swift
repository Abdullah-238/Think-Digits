import UIKit

class GameViewController: UIViewController {

    var gameInfo: GameInfo!
    
    var IsMix : Bool = false
    @IBOutlet weak var lblNumbersOfQuesations: UILabel!
    @IBOutlet weak var lblQuesationNumber: UILabel!
    @IBOutlet weak var lblNum1: UILabel!
    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var lblOperation: UILabel!
    @IBOutlet weak var txtAnswer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (gameInfo.eOperation == GameInfo.enOperation.mix)
        {
            IsMix = true
        }
        
        SelectOperation()
        SelectLevel()
        Load()
    }
    
    
    
    func  Load()
    {
        lblNumbersOfQuesations.text = String (gameInfo.NumberOfQuestions)
        lblQuesationNumber.text = String (gameInfo.QuesationNumber)
        lblNum1.text = String (gameInfo.Num1)
        lblNum.text = String (gameInfo.Num2)
        lblOperation.text = gameInfo.OperationText
    }
    
    func MixOperation()
    {
        var op : Int = Int(Int.random(in: 1...3))
        
        switch op
        {
        case 1:
            gameInfo.eOperation = .addition
        case 2:
            gameInfo.eOperation = .subtraction
        case 3:
            gameInfo.eOperation = .multiplication
        default:
            gameInfo.eOperation = .addition
        }
    }
    
    @IBAction func btnCheck(_ sender: Any) {
        
        
        if (txtAnswer.text?.isEmpty ?? true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter an answer.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            checkAnswer()
        }
        
    }
    
    func SelectOperation() {
       
        if gameInfo.eOperation == .mix {
                MixOperation()
            }
        switch gameInfo.eOperation {
        case .addition:
            gameInfo.OperationText = "+"
        case .subtraction:
            gameInfo.OperationText = "-"
        case .multiplication:
            gameInfo.OperationText = "*"
        case .division:
            gameInfo.OperationText = "/"
        case .mix:
            gameInfo.OperationText = "Mix"
        default:
            gameInfo.OperationText = "Mix"
        }
    }
    
    func SelectLevel() {
        var randomNumber: Double
        
        switch gameInfo.elevel {
        case .hard:
            randomNumber = Double(Int.random(in: 500...1000))
        case .medium:
            randomNumber = Double(Int.random(in: 100...500))
        case .easy:
            randomNumber = Double(Int.random(in: 1...100))
        default:
            randomNumber = Double(Int.random(in: 1...100))
        }
        
        gameInfo.Num1 = randomNumber
        gameInfo.Num2 = randomNumber
    }

    func checkAnswer()  {
        if let userAnswer = Double(txtAnswer.text ?? "0") {
            gameInfo.Result = userAnswer
            

            
            switch gameInfo.eOperation {
            case .addition:
                if (gameInfo.Num1 + gameInfo.Num2 == gameInfo.Result)
                {
                    gameInfo.CorrectAnswer += 1
                    DisplayAnswerDialoge()
                    
                } else
                {
                    gameInfo.WrongAnswer += 1
                    DisplayAnswerDialoge( isTrure: false)
                }
                gameInfo.QuesationNumber += 1
                
            case .subtraction:
                if (gameInfo.Num1 - gameInfo.Num2 == gameInfo.Result)
                {
                    gameInfo.CorrectAnswer += 1
                    DisplayAnswerDialoge()
                } else {
                    gameInfo.WrongAnswer += 1
                    DisplayAnswerDialoge( isTrure: false)

                }
                gameInfo.QuesationNumber += 1

            case .multiplication:
                if (gameInfo.Num1 * gameInfo.Num2 == gameInfo.Result) {
                    gameInfo.CorrectAnswer += 1
                    DisplayAnswerDialoge()

                } else {
                    gameInfo.WrongAnswer += 1
                    DisplayAnswerDialoge( isTrure: false)

                }
                gameInfo.QuesationNumber += 1

            case .division:
                if (gameInfo.Num2 != 0 && gameInfo.Num1 / gameInfo.Num2 == gameInfo.Result) {
                    gameInfo.CorrectAnswer += 1
                    DisplayAnswerDialoge()

                } else {
                    gameInfo.WrongAnswer += 1
                    DisplayAnswerDialoge( isTrure: false)

                }
                gameInfo.QuesationNumber += 1
                break
            default:
                break
            }
        }
        
      
        if (gameInfo.NumberOfQuestions < gameInfo.QuesationNumber)
        {
            let vcGame = storyboard?.instantiateViewController(identifier: "ResultID") as! ResultViewController
            
            vcGame.GameResult = gameInfo
            
            vcGame.modalPresentationStyle = .fullScreen

            present(vcGame, animated: true,completion: nil)
            
            return
        }
        

    }
    
    func moveToNextScreen() {

        if gameInfo.NumberOfQuestions < gameInfo.QuesationNumber {
            let vcGame = storyboard?.instantiateViewController(identifier: "ResultID") as! ResultViewController
            vcGame.GameResult = gameInfo
            vcGame.modalPresentationStyle = .fullScreen
            present(vcGame, animated: true, completion: nil)
        } else
        {

            SelectLevel()
            Load()
        }
    }
    
    func DisplayAnswerDialoge(isTrure : Bool = true ) {
        let message = isTrure ? "Your answer is Correct" : "Your answer is Wrong"
        
        let alert = UIAlertController(title: "Answer", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in

            self.moveToNextScreen()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

}
