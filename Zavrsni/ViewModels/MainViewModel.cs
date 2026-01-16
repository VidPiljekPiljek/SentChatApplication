using Avalonia.Dialogs.Internal;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Sentry;
using Zavrsni.Data;
using Zavrsni.Factories;

namespace Zavrsni.ViewModels;

public partial class MainViewModel : ViewModelBase
{
    private readonly PageFactory _pageFactory;

    [ObservableProperty]
    [NotifyPropertyChangedFor(nameof(HomePageIsActive))]
    [NotifyPropertyChangedFor(nameof(MessagesPageIsActive))]
    [NotifyPropertyChangedFor(nameof(AccountPageIsActive))]
    [NotifyPropertyChangedFor(nameof(SettingsPageIsActive))]
    private PageViewModel _currentPage;

    // May be a lot to keep track of, but is a great way to navigate cause of the abstraction
    public bool HomePageIsActive => CurrentPage.PageName == ApplicationPageNames.Home;
    public bool MessagesPageIsActive => CurrentPage.PageName == ApplicationPageNames.Messages;
    public bool AccountPageIsActive => CurrentPage.PageName == ApplicationPageNames.Account;
    public bool SettingsPageIsActive => CurrentPage.PageName == ApplicationPageNames.Settings;

    public MainViewModel(PageFactory pageFactory)
    {
        _pageFactory = pageFactory;

        _currentPage = new HomePageViewModel();
    }

    // Using this way of navigating to pages is more performant than using the NavigationService
    [RelayCommand]
    private void NavigateToMessages()
    {
        if (MessagesPageIsActive) return;

        SentrySdk.AddBreadcrumb(
            message: $"Navigating to messages page.",
            category: "Page navigation",
            level: BreadcrumbLevel.Info
        );

        CurrentPage = _pageFactory.GetPageViewModel(ApplicationPageNames.Messages);
    }

    [RelayCommand]
    private void NavigateToAccount()
    {
        if (AccountPageIsActive) return;

        SentrySdk.AddBreadcrumb(
            message: $"Navigating to account page.",
            category: "Page navigation",
            level: BreadcrumbLevel.Info
        );

        CurrentPage = _pageFactory.GetPageViewModel(ApplicationPageNames.Account);
    }

    [RelayCommand]
    private void NavigateToSettings()
    {
        if (SettingsPageIsActive) return;

        SentrySdk.AddBreadcrumb(
            message: $"Navigating to settings page.",
            category: "Page navigation",
            level: BreadcrumbLevel.Info
        );

        CurrentPage = _pageFactory.GetPageViewModel(ApplicationPageNames.Settings);
    }
}
