using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Zavrsni.Data;
using Zavrsni.Factories;

namespace Zavrsni.ViewModels;

public partial class MainViewModel : ViewModelBase
{
    private readonly PageFactory _pageFactory;

    [ObservableProperty]
    [NotifyPropertyChangedFor(nameof(HomePageIsActive))]
    [NotifyPropertyChangedFor(nameof(MessagesPageIsActive))]
    private PageViewModel _currentPage;

    public bool HomePageIsActive => CurrentPage.PageName == ApplicationPageNames.Home;
    public bool MessagesPageIsActive => CurrentPage.PageName == ApplicationPageNames.Messages;

    public MainViewModel(PageFactory pageFactory)
    {
        _pageFactory = pageFactory;

        _currentPage = new HomePageViewModel();
    }

    [RelayCommand]
    private void NavigateToMessages()
    {
        CurrentPage = _pageFactory.GetPageViewModel(ApplicationPageNames.Messages);
    }
}
