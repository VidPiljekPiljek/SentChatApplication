using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Data.Core;
using Avalonia.Data.Core.Plugins;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.JavaScript;
using Zavrsni.Data;
using Zavrsni.DbContexts;
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

        collection.AddSingleton<ISentChatAppDbContextFactory>(new SentChatAppDbContextFactory("Data source=sentchatapp.db"));

        collection.AddSingleton<MainWindowViewModel>();
        collection.AddTransient<MainViewModel>();
        collection.AddTransient<LoginViewModel>();
        collection.AddTransient<RegistrationViewModel>();
        collection.AddTransient<HomePageViewModel>();
        collection.AddTransient<MessagesPageViewModel>();
        collection.AddTransient<AccountPageViewModel>();
        collection.AddTransient<SettingsPageViewModel>();
        collection.AddTransient<GroupsPageViewModel>();

        collection.AddSingleton<Func<ApplicationPageNames, PageViewModel>>(x => name => name switch
        {
            ApplicationPageNames.Home => x.GetRequiredService<HomePageViewModel>(),
            ApplicationPageNames.Messages => x.GetRequiredService<MessagesPageViewModel>(),
            ApplicationPageNames.Groups => x.GetRequiredService<GroupsPageViewModel>(),
            ApplicationPageNames.Account => x.GetRequiredService<AccountPageViewModel>(),
            ApplicationPageNames.Settings => x.GetRequiredService<SettingsPageViewModel>(),
            _ => throw new ArgumentOutOfRangeException(nameof(name))
        });

        collection.AddSingleton<PageFactory>();

        collection.AddSingleton<Func<ApplicationViewNames, ViewModelBase>>(x => name => name switch
        {
            ApplicationViewNames.Login => x.GetRequiredService<LoginViewModel>(),
            ApplicationViewNames.Main => x.GetRequiredService<MainViewModel>(),
            ApplicationViewNames.Registration => x.GetRequiredService<RegistrationViewModel>(),
            _ => throw new ArgumentOutOfRangeException(nameof(name))
        });

        collection.AddSingleton<ViewFactory>();

        var serviceProvider = collection.BuildServiceProvider();

        ISentChatAppDbContextFactory sentChatAppDbContextFactory = serviceProvider.GetRequiredService<ISentChatAppDbContextFactory>();
        try
        {
            using (SentChatAppDbContext dbContext = sentChatAppDbContextFactory.CreateDbContext())
            {
                dbContext.Database.Migrate();
            }
        }
        catch (Exception ex)
        {
            File.AppendAllText("app.log", $"[{DateTime.Now}] {ex.Message}\n");
        }

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