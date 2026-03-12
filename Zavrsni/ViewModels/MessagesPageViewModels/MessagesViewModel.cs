using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Mappers;
using Zavrsni.Models;
using Zavrsni.Services;
using Zavrsni.Stores;

namespace Zavrsni.ViewModels.MessagesPageViewModels
{
    // Separating the larger view into smaller views for easy maintainability
    public partial class MessagesViewModel : ViewModelBase
    {
        private readonly MessageService _messageService;
        private readonly MessageStore _messageStore;
        private readonly ConversationService _conversationService;
        private readonly UserService _userService;

        [ObservableProperty]
        private ChatInputBoxViewModel _chatInputBoxViewModel;

        [ObservableProperty]
        private string _conversationName;

        [ObservableProperty]
        private ObservableCollection<MessageDisplayViewModel> _messages = new ObservableCollection<MessageDisplayViewModel>();

        public MessagesViewModel(MessageService messageService, ConversationService conversationService, UserService userService)
        {
            _messageService = messageService;
            _conversationService = conversationService;
            _userService = userService;

            _chatInputBoxViewModel = new ChatInputBoxViewModel(conversationService, userService, messageService, this);

            _messageService.MessageReceived += (message) => AddMessage(message);
        }

        public async void LoadMessagesForConversation(string conversationId)
        {
            Messages.Clear();

            ObservableCollection<Message> messages = new ObservableCollection<Message>(await _messageService.LoadConversationMessagesAsync(conversationId));

            foreach(var message in messages)
            {
                AddMessage(message);
            }
        }

        public void GetSelectedConversationTitle()
        {
            ConversationName = _conversationService.GetSelectedConversationTitle();
        }

        public void AddMessage(Message message)
        {
            var vm = new MessageDisplayViewModel(_messageService, message, _userService);
            vm.MessageDeleted += OnMessageDeleted;
            Messages.Add(vm);
        }

        public void OnMessageDeleted(object? sender, MessageDisplayViewModel deletedMessage)
        {
            Messages.Remove(deletedMessage);
            deletedMessage.MessageDeleted -= OnMessageDeleted;
        }
    }
}
