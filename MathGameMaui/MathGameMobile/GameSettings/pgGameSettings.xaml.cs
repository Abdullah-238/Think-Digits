
namespace MathGameMobile;

public partial class NewPage1 : ContentPage
{
	public NewPage1()
	{
		InitializeComponent();
	}

    protected override bool OnBackButtonPressed()
    {
        return true;
    }

    private async void Button_Clicked_1(object sender, EventArgs e)
    {
        string Input = string.Empty;

        if (!string.IsNullOrEmpty(enNumberOfQuesation.Text))
            Input = enNumberOfQuesation.Text.Trim();
        else
        {
            await DisplayAlert("Error", "this field can't be a empty", "Ok");
            return;
        }

        if (!Input.Any(char.IsDigit))
        {
            await DisplayAlert("Error", "this field only accept number", "Ok");
            return;
        }


        if ( Input == "0" || string.IsNullOrEmpty(Input))
        {
            await DisplayAlert("Error", "this field can't be a empty", "Ok");
            return;
        }

        short NumberOfQuesation = Convert.ToInt16(Input);


        CompleteSettings(NumberOfQuesation);
    }

    async void CompleteSettings(short NumberOfQuesation)
    {

        short Level = 0, Operation = 0;
        bool IsMix = false;

        if (rbEasy.IsChecked)
            Level = 1;
        else if (rbMed.IsChecked)
            Level = 2;
        else
            Level = 3;


        if (rbAdd.IsChecked)
            Operation = 1;
        else if (rbSub.IsChecked)
            Operation = 2;
        else if (rbMult.IsChecked)
            Operation = 3;
        else if (rbDiv.IsChecked)
            Operation = 4;


        if (rbMix.IsChecked)
        {
            Operation = 5;
            IsMix = true;
        }

        await Navigation.PushAsync(new pgQusationBoard(NumberOfQuesation, Level, Operation, IsMix));


    }


}