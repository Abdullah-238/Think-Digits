using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MathGame
{
    public class clsGameInfo
    {
        public enum enLevel { Easy = 1, Med = 2, Hard = 3 };
        public enum enOperation { Add = 1, Sub = 2, Multi = 3, Div = 4, Mix = 5 };

        public enLevel Level;

        public enOperation Operation;

        public short NumberOfQuestion;

        public double Num1 = 0;

        public double Num2 = 0;

        public double Result = 0;

        public double UserInput = 0 ;

        public int QuestionNumber = 0;

        public string OperationText = "";

        public int CorrectAnswer = 0;

        public int WrongAnswer =0 ;

        public bool IsMix = false;
    }
}
