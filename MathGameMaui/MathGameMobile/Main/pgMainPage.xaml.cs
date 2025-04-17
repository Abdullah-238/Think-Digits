namespace MathGameMobile
{
    public partial class pgMainPage : ContentPage
    {
        int count = 0;

        public pgMainPage()
        {
            InitializeComponent();
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new NewPage1());
        }

        private async void Button_Clicked_1(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }

    }

}
