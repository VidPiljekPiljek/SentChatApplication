package mono.io.sentry.android.core;


public class AppState_AppStateListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		io.sentry.android.core.AppState.AppStateListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onBackground:()V:GetOnBackgroundHandler:Sentry.JavaSdk.Android.Core.AppState/IAppStateListenerInvoker, Sentry.Bindings.Android\n" +
			"n_onForeground:()V:GetOnForegroundHandler:Sentry.JavaSdk.Android.Core.AppState/IAppStateListenerInvoker, Sentry.Bindings.Android\n" +
			"";
		mono.android.Runtime.register ("Sentry.JavaSdk.Android.Core.AppState+IAppStateListenerImplementor, Sentry.Bindings.Android", AppState_AppStateListenerImplementor.class, __md_methods);
	}

	public AppState_AppStateListenerImplementor ()
	{
		super ();
		if (getClass () == AppState_AppStateListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Sentry.JavaSdk.Android.Core.AppState+IAppStateListenerImplementor, Sentry.Bindings.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public void onBackground ()
	{
		n_onBackground ();
	}

	private native void n_onBackground ();

	public void onForeground ()
	{
		n_onForeground ();
	}

	private native void n_onForeground ();

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
