import UIKit

class ChooseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    var Level: [String] = ["Easy", "Medium", "Hard"]
    var Operation: [String] = ["Add", "Sub", "Mul", "Div", "Mix"]
    
    var gameinfo: GameInfo?
    
    @IBOutlet weak var txtNumberOfQuesation: UITextField!
    @IBOutlet weak var pkvLevel: UIPickerView!
    @IBOutlet weak var pkvOperation: UIPickerView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        gameinfo = GameInfo()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
               view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
    @IBAction func btnStart(_ sender: Any)
    {
        var numberOfQuesation: Int = 0 
        
        if (txtNumberOfQuesation.text?.isEmpty ?? true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter a number of questions.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else
        {
             numberOfQuesation = Int(txtNumberOfQuesation.text ?? "0") ?? 0
        }
        
        let vcGame = storyboard?.instantiateViewController(identifier: "GameID") as! GameViewController
        
        gameinfo?.NumberOfQuestions = numberOfQuesation

        vcGame.gameInfo = gameinfo
        
        vcGame.modalPresentationStyle = .fullScreen

        present(vcGame, animated: true,completion: nil)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == pkvLevel
        {
            return Level.count
        } else if pickerView == pkvOperation
        {
            return Operation.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pkvLevel
        {
            return Level[row]
        } else if pickerView == pkvOperation
        {
            return Operation[row]
        }
        return nil
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
       
        if pickerView == pkvLevel
        {
            let selectedLevel = Level[row]
            gameinfo?.elevel = GetLevel(LevelSelected: selectedLevel)
            
        }
        else if pickerView == pkvOperation
        {
            let selectedOperation = Operation[row]
            gameinfo?.eOperation = GetOperation(OperationSelected: selectedOperation)
        }
    }
    
    func GetOperation(OperationSelected: String) -> GameInfo.enOperation? {
        switch OperationSelected {
        case "Add":
            return .addition
        case "Sub":
            return .subtraction
        case "Mul":
            return .multiplication
        case "Div":
            return .division
        case "Mix":
            return .mix
        default:
            return .mix
        }
    }
    
    func GetLevel(LevelSelected: String) -> GameInfo.enLevel?
    {
        switch LevelSelected.lowercased() {
        case "easy":
            return .easy
        case "medium":
            return .medium
        case "hard":
            return .hard
        default:
            return .hard
        }
        
    }
}
