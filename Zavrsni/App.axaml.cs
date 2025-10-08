using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Data.Core;
using Avalonia.Data.Core.Plugins;
using Avalonia.Markup.Xaml;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Linq;
using Zavrsni.Data;
using Zavrsni.Factories;
using Zavrsni.ViewModels;
using Zavrsni.Views;

namespace Zavrsni;

public partial class App : Application
{
    public override void Initialize()
    {
        AvaloniaXamlLoader.Load(this);
    }

    public override void OnFrameworkInitializationCompleted()
    {
        var collection = new ServiceCollection();
        collection.AddSingleton<MainWindowViewModel>();
        collection.AddTransient<MainViewModel>();
        collection.AddTransient<LoginViewModel>();
        collection.AddTransient<HomePageViewModel>();
        collection.AddTransient<MessagesPageViewModel>();

        collection.AddSingleton<Func<ApplicationPageNames, PageViewModel>>(x => name => name switch
        {
            ApplicationPageNames.Home => x.GetRequiredService<HomePageViewModel>(),
            ApplicationPageNames.Messages => x.GetRequiredService<MessagesPageViewModel>(),
            _ => throw new ArgumentOutOfRangeException(nameof(name))
        });

        collection.AddSingleton<PageFactory>();

        collection.AddSingleton<Func<ApplicationViewNames, ViewModelBase>>(x => name => name switch
        {
            ApplicationViewNames.Login => x.GetRequiredService<LoginViewModel>(),
            ApplicationViewNames.Main => x.GetRequiredService<MainViewModel>(),
            _ => throw new ArgumentOutOfRangeException(nameof(name))
        });

        collection.AddSingleton<ViewFactory>();

        var serviceProvider = collection.BuildServiceProvider();

        if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
        {
            // Avoid duplicate validations from both Avalonia and the CommunityToolkit. 
            // More info: https://docs.avaloniaui.net/docs/guides/development-guides/data-validation#manage-validationplugins
            DisableAvaloniaDataAnnotationValidation();
            desktop.MainWindow = new MainWindow
            {
                DataContext = serviceProvider.GetRequiredService<MainWindowViewModel>()
            };
        }
        else if (ApplicationLifetime is ISingleViewApplicationLifetime singleViewPlatform)
        {
            singleViewPlatform.MainView = new MainView
            {
                DataContext = serviceProvider.GetRequiredService<MainWindowViewModel>()
            };
        }

        base.OnFrameworkInitializationCompleted();
    }

    private void DisableAvaloniaDataAnnotationValidation()
    {
        // Get an array of plugins to remove
        var dataValidationPluginsToRemove =
            BindingPlugins.DataValidators.OfType<DataAnnotationsValidationPlugin>().ToArray();

        // remove each entry found
        foreach (var plugin in dataValidationPluginsToRemove)
        {
            BindingPlugins.DataValidators.Remove(plugin);
        }
    }
}