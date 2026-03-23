using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Zavrsni.ViewModels;

namespace Zavrsni.Views;

public partial class AccountPageView : UserControl
{
    public AccountPageViewModel ViewModel => DataContext as AccountPageViewModel;

    public AccountPageView()
    {
        InitializeComponent();
    }

    private void Button_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        var topLevel = TopLevel.GetTopLevel(this);
        ViewModel.SelectProfilePictureAsync(topLevel);
    }
}