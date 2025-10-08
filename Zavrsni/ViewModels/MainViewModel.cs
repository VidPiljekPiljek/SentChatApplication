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
    [NotifyPropertyChangedFor(nameof(GroupsPageIsActive))]
    [NotifyPropertyChangedFor(nameof(AccountPageIsActive))]
    [NotifyPropertyChangedFor(nameof(SettingsPageIsActive))]
    private PageViewModel _currentPage;

    public bool HomePageIsActive => CurrentPage.PageName == ApplicationPageNames.Home;
    public bool MessagesPageIsActive => CurrentPage.PageName == ApplicationPageNames.Messages;
    public bool GroupsPageIsActive => CurrentPage.PageName == ApplicationPageNames.Groups;
    public bool AccountPageIsActive => CurrentPage.PageName == ApplicationPageNames.Account;
    public bool SettingsPageIsActive => CurrentPage.PageName == ApplicationPageNames.Settings;

    public MainViewModel(PageFactory pageFactory)
    {
        _pageFactory = pageFactory;

        _currentPage = new HomePageViewModel();
    }

    [RelayCommand]
    private void NavigateToMessages()
    {
        if (MessagesPageIsActive) return;

        CurrentPage = _pageFactory.GetPageViewModel(ApplicationPageNames.Messages);
    }

    [RelayCommand]
    private void NavigateToGroups()
    {
        if (GroupsPageIsActive) return;

        CurrentPage = _pageFactory.GetPageViewModel(ApplicationPageNames.Groups);
    }

    [RelayCommand]
    private void NavigateToAccount()
    {
        if (AccountPageIsActive) return;

        CurrentPage = _pageFactory.GetPageViewModel(ApplicationPageNames.Account);
    }

    [RelayCommand]
    private void NavigateToSettings()
    {
        if (SettingsPageIsActive) return;

        CurrentPage = _pageFactory.GetPageViewModel(ApplicationPageNames.Settings);
    }
}
