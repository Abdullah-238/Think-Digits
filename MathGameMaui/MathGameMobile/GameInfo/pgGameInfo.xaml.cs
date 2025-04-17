using MathGame;

namespace MathGameMobile;

public partial class pgGameInfo : ContentPage
{
    clsGameInfo GameInfo;
    public  pgGameInfo(clsGameInfo gameInfo)
	{
        InitializeComponent();

        GameInfo = gameInfo;
    }

    protected override bool OnBackButtonPressed()
    {
        return true;
    }


    private  void ContentPage_Loaded(object sender, EventArgs e)
    {

        if (GameInfo.WrongAnswer > GameInfo.CorrectAnswer)
        {
            lbFinalResult.Text = "Fail";
        }

        else if (GameInfo.WrongAnswer < GameInfo.CorrectAnswer)
        {
            lbFinalResult.Text = "Pass";
        }
        else
        {
            lbFinalResult.Text = "Draw";
        }
        
        if (GameInfo.IsMix)
            lbOperationLevel.Text = "Mix";
        else
            lbOperationLevel.Text = GameInfo.Operation.ToString();

        lbNumberOfQuesations.Text = GameInfo.NumberOfQuestion.ToString();
        lbWrongQuesation.Text = GameInfo.WrongAnswer.ToString();
        lbRigthQuesation.Text = GameInfo.CorrectAnswer.ToString();
        lbQuesationLevel.Text = GameInfo.Level.ToString();

    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        await Navigation.PopToRootAsync();

    }
}