using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Data.Core;
using Avalonia.Data.Core.Plugins;
using Avalonia.Markup.Xaml;
using Avalonia.Threading;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Sentry;
using System;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.JavaScript;
using Zavrsni.Authenticators;
using Zavrsni.Data;
using Zavrsni.DbContexts;
using Zavrsni.Factories;
using Zavrsni.Repositories;
using Zavrsni.Services;
using Zavrsni.Stores;
using Zavrsni.ViewModels;
using Zavrsni.ViewModels.MessagesPageViewModels;
using Zavrsni.Views;

namespace Zavrsni;

public partial class App : Application
{
    public override void Initialize()
    {
        AvaloniaXamlLoader.Load(this);
    }

    public async override void OnFrameworkInitializationCompleted()
    {
        var collection = new ServiceCollection();

        collection.AddSingleton<MainWindowViewModel>();
        collection.AddTransient<MainViewModel>();
        collection.AddTransient<LoginViewModel>();
        collection.AddTransient<RegistrationViewModel>();
        collection.AddTransient<HomePageViewModel>();
        collection.AddTransient<MessagesPageViewModel>();
        collection.AddTransient<AccountPageViewModel>();
        collection.AddTransient<SettingsPageViewModel>();

        collection.AddTransient<ConversationSidebarViewModel>();
        collection.AddTransient<MessagesViewModel>();

        collection.AddSingleton<UserService>();
        collection.AddSingleton<UserStore>();
        collection.AddSingleton<UserAuthenticator>();
        collection.AddSingleton<UserRepository>();

        collection.AddSingleton<ConversationService>();
        collection.AddSingleton<ConversationStore>();
        collection.AddSingleton<ConversationRepository>();

        collection.AddSingleton<ConversationMemberService>();
        collection.AddSingleton<ConversationMemberRepository>();

        collection.AddSingleton<MessageService>();
        collection.AddSingleton<MessageStore>();
        collection.AddSingleton<MessageRepository>();

        collection.AddSingleton<ConversationSidebarViewModel>();
        collection.AddSingleton<MessagesViewModel>();
        collection.AddTransient<ChatInputBoxViewModel>();

        collection.AddSingleton<Func<ApplicationPageNames, PageViewModel>>(x => name => name switch
        {
            ApplicationPageNames.Home => x.GetRequiredService<HomePageViewModel>(),
            ApplicationPageNames.Messages => x.GetRequiredService<MessagesPageViewModel>(),
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

        var url = "https://qcnytsojnhpmpqtsdscn.supabase.co";
        var key = "sb_secret_Z8jey8NYm6hOggZZrhhWcA_ys8E3B2E";

        var options = new Supabase.SupabaseOptions
        {
            AutoConnectRealtime = false
        };

        collection.AddSingleton(provider =>
        {
            return new Supabase.Client(url, key, options);
        });

        var serviceProvider = collection.BuildServiceProvider();

        var supabase = serviceProvider.GetRequiredService<Supabase.Client>();

        await supabase.InitializeAsync();

        // Initializing Sentry
        SentrySdk.Init(options =>
        {
            // A Sentry Data Source Name (DSN) is required.
            // See https://docs.sentry.io/product/sentry-basics/dsn-explainer/
            // You can set it in the SENTRY_DSN environment variable, or you can set it in code here.
            options.Dsn = "https://4c4c4b40e933c8c1be3e10c4eb95844e@o4510641615405056.ingest.de.sentry.io/4510641626939472";

            // When debug is enabled, the Sentry client will emit detailed debugging information to the console.
            // This might be helpful, or might interfere with the normal operation of your application.
            // We enable it here for demonstration purposes when first trying Sentry.
            // You shouldn't do this in your applications unless you're troubleshooting issues with Sentry.
            options.Debug = true;

            // This option is recommended. It enables Sentry's "Release Health" feature.
            options.AutoSessionTracking = true;
        });

        // Used for tracking unhandled exceptions
        AppDomain.CurrentDomain.UnhandledException += (s, e) =>
        {
            var ex = (Exception)e.ExceptionObject;
            SentrySdk.CaptureException(ex);
            serviceProvider.GetRequiredService<MainWindowViewModel>().CreateErrorDialog("An unhandled exception has occurred, please try again.");
            serviceProvider.GetRequiredService<MainWindowViewModel>().OpenDialog();
        };

        Dispatcher.UIThread.UnhandledException += (s, e) =>
        {
            SentrySdk.CaptureException(e.Exception);
            e.Handled = true;  // Prevents the application from crashing
            serviceProvider.GetRequiredService<MainWindowViewModel>().CreateErrorDialog("An unhandled exception has occurred, please try again.");
            serviceProvider.GetRequiredService<MainWindowViewModel>().OpenDialog();
        };

        // Connection to Supabase
        //var url = Environment.GetEnvironmentVariable("https://qcnytsojnhpmpqtsdscn.supabase.co");
        //var key = Environment.GetEnvironmentVariable("sb_publishable_H9GqW0ETCMnkZFLksqsnUQ_SlJacNO2");

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