
public class GameInfo
{
    
    public  enum enLevel: Int {
        case hard = 3
        case medium = 2
        case easy = 1
    }
    
    public enum enOperation: Int {
        case addition = 1
        case subtraction = 2
        case multiplication = 3
        case division = 4
        case mix = 5
    }
    
    
    public var elevel: enLevel!
    public var eOperation: enOperation!
    public var NumberOfQuestions: Int
    public var Num1: Double
    public var Num2: Double
    public var Result: Double
    public var UserInput: Double
    public var QuesationNumber: Int
    public var OperationText: String
    public var CorrectAnswer: Int
    public var WrongAnswer: Int
    
    public init() {
        self.elevel = .easy
        self.eOperation = .addition
        self.NumberOfQuestions = 1
        self.Num1 = 0.0
        self.Num2 = 0.0
        self.Result = 0.0
        self.UserInput = 0.0
        self.QuesationNumber = 1
        self.OperationText = "+"
        self.CorrectAnswer = 0
        self.WrongAnswer = 0
    }
}
