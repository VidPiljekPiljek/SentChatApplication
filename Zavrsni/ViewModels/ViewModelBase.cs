using CommunityToolkit.Mvvm.ComponentModel;

namespace Zavrsni.ViewModels;

public abstract class ViewModelBase : ObservableObject
{
    public bool IsLoaded { get; set; }

    public virtual bool LoadViewModel()
    {
        return true;
    }
}
