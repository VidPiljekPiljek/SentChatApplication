; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [255 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [765 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 42
	i64 u0x01109b0e4d99e61f, ; 1: System.ComponentModel.Annotations.dll => 13
	i64 u0x0284512fad379f7e, ; 2: System.Runtime.Handles => 105
	i64 u0x02abedc11addc1ed, ; 3: lib_Mono.Android.Runtime.dll.so => 171
	i64 u0x02f55bf70672f5c8, ; 4: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 5: lib_Xamarin.AndroidX.AppCompat.dll.so => 208
	i64 u0x03621c804933a890, ; 6: System.Buffers => 7
	i64 u0x0399610510a38a38, ; 7: lib_System.Private.DataContractSerialization.dll.so => 86
	i64 u0x0514f1a3ae77a228, ; 8: lib_Xamarin.Kotlin.StdLib.Common.dll.so => 244
	i64 u0x0517ef04e06e9f76, ; 9: System.Net.Primitives => 71
	i64 u0x0581db89237110e9, ; 10: lib_System.Collections.dll.so => 12
	i64 u0x05a0cd02a6c1cd3c, ; 11: Svg.Skia.dll => 203
	i64 u0x05a1c25e78e22d87, ; 12: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 102
	i64 u0x0600544dd3961080, ; 13: HarfBuzzSharp => 195
	i64 u0x06388ffe9f6c161a, ; 14: System.Xml.Linq.dll => 156
	i64 u0x06600c4c124cb358, ; 15: System.Configuration.dll => 19
	i64 u0x0680a433c781bb3d, ; 16: Xamarin.AndroidX.Collection.Jvm => 213
	i64 u0x069fff96ec92a91d, ; 17: System.Xml.XPath.dll => 161
	i64 u0x070b0847e18dab68, ; 18: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 222
	i64 u0x0739448d84d3b016, ; 19: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 237
	i64 u0x07469f2eecce9e85, ; 20: mscorlib.dll => 167
	i64 u0x07dcdc7460a0c5e4, ; 21: System.Collections.NonGeneric => 10
	i64 u0x088610fc2509f69e, ; 22: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 238
	i64 u0x08a7c865576bbde7, ; 23: System.Reflection.Primitives => 96
	i64 u0x08f3c9788ee2153c, ; 24: Xamarin.AndroidX.DrawerLayout => 220
	i64 u0x09138715c92dba90, ; 25: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x092266563089ae3e, ; 26: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x09d144a7e214d457, ; 27: System.Security.Cryptography => 127
	i64 u0x09e2b9f743db21a8, ; 28: lib_System.Reflection.Metadata.dll.so => 95
	i64 u0x0a78a8431e4734f8, ; 29: lib_Avalonia.Fonts.Inter.dll.so => 188
	i64 u0x0abb3e2b271edc45, ; 30: System.Threading.Channels.dll => 140
	i64 u0x0b06b1feab070143, ; 31: System.Formats.Tar => 39
	i64 u0x0be2e1f8ce4064ed, ; 32: Xamarin.AndroidX.ViewPager => 240
	i64 u0x0c59ad9fbbd43abe, ; 33: Mono.Android => 172
	i64 u0x0c74af560004e816, ; 34: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c83c82812e96127, ; 35: lib_System.Net.Mail.dll.so => 67
	i64 u0x0cfd116e78cbc305, ; 36: lib_ShimSkiaSharp.dll.so => 199
	i64 u0x0d13cd7cce4284e4, ; 37: System.Security.SecureString => 130
	i64 u0x0d50068b8aee1b51, ; 38: lib_Zavrsni.Android.dll.so => 0
	i64 u0x0d5c95da1348bb1c, ; 39: Svg.Model => 202
	i64 u0x0e04e702012f8463, ; 40: Xamarin.AndroidX.Emoji2 => 221
	i64 u0x0e14e73a54dda68e, ; 41: lib_System.Net.NameResolution.dll.so => 68
	i64 u0x0f5e7abaa7cf470a, ; 42: System.Net.HttpListener => 66
	i64 u0x1001f97bbe242e64, ; 43: System.IO.UnmanagedMemoryStream => 57
	i64 u0x102a31b45304b1da, ; 44: Xamarin.AndroidX.CustomView => 219
	i64 u0x1065c4cb554c3d75, ; 45: System.IO.IsolatedStorage.dll => 52
	i64 u0x10f6cfcbcf801616, ; 46: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 47: System.Security.Cryptography.Primitives => 125
	i64 u0x11a603952763e1d4, ; 48: System.Net.Mail => 67
	i64 u0x11a70d0e1009fb11, ; 49: System.Net.WebSockets.dll => 81
	i64 u0x11fbe62d469cc1c8, ; 50: Microsoft.VisualStudio.DesignTools.TapContract.dll => 251
	i64 u0x12128b3f59302d47, ; 51: lib_System.Xml.Serialization.dll.so => 158
	i64 u0x123639456fb056da, ; 52: System.Reflection.Emit.Lightweight.dll => 92
	i64 u0x12521e9764603eaa, ; 53: lib_System.Resources.Reader.dll.so => 99
	i64 u0x12d3b63863d4ab0b, ; 54: lib_System.Threading.Overlapped.dll.so => 141
	i64 u0x134eab1061c395ee, ; 55: System.Transactions => 151
	i64 u0x13beedefb0e28a45, ; 56: lib_System.Xml.XmlDocument.dll.so => 162
	i64 u0x13f1e5e209e91af4, ; 57: lib_Java.Interop.dll.so => 169
	i64 u0x143d8ea60a6a4011, ; 58: Microsoft.Extensions.DependencyInjection.Abstractions => 198
	i64 u0x1497051b917530bd, ; 59: lib_System.Net.WebSockets.dll.so => 81
	i64 u0x14b78ce3adce0011, ; 60: Microsoft.VisualStudio.DesignTools.TapContract => 251
	i64 u0x152a448bd1e745a7, ; 61: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 62: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x15bdc156ed462f2f, ; 63: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 64: System.Resources.Writer.dll => 101
	i64 u0x16bf2a22df043a09, ; 65: System.IO.Pipes.dll => 56
	i64 u0x16ea2b318ad2d830, ; 66: System.Security.Cryptography.Algorithms => 120
	i64 u0x16eeae54c7ebcc08, ; 67: System.Reflection.dll => 98
	i64 u0x17125c9a85b4929f, ; 68: lib_netstandard.dll.so => 168
	i64 u0x1716866f7416792e, ; 69: lib_System.Security.AccessControl.dll.so => 118
	i64 u0x1752c12f1e1fc00c, ; 70: System.Core => 21
	i64 u0x17f10bff77f05b2e, ; 71: Avalonia.Remote.Protocol => 189
	i64 u0x17f9358913beb16a, ; 72: System.Text.Encodings.Web => 137
	i64 u0x1809fb23f29ba44a, ; 73: lib_System.Reflection.TypeExtensions.dll.so => 97
	i64 u0x18a9befae51bb361, ; 74: System.Net.WebClient => 77
	i64 u0x19777fba3c41b398, ; 75: Xamarin.AndroidX.Startup.StartupRuntime.dll => 235
	i64 u0x19a4c090f14ebb66, ; 76: System.Security.Claims => 119
	i64 u0x1a86fbe2485a9f00, ; 77: Avalonia.DesignerSupport.dll => 176
	i64 u0x1a91866a319e9259, ; 78: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 79: lib_System.dll.so => 165
	i64 u0x1aea8f1c3b282172, ; 80: lib_System.Net.Ping.dll.so => 70
	i64 u0x1bc766e07b2b4241, ; 81: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 233
	i64 u0x1c753b5ff15bce1b, ; 82: Mono.Android.Runtime.dll => 171
	i64 u0x1cd47467799d8250, ; 83: System.Threading.Tasks.dll => 145
	i64 u0x1d23eafdc6dc346c, ; 84: System.Globalization.Calendars.dll => 40
	i64 u0x1d3dd0218cdc9fa5, ; 85: Avalonia.Markup.Xaml => 178
	i64 u0x1d711378718cece2, ; 86: Avalonia.Controls.ColorPicker => 186
	i64 u0x1da87c3fe68efc1d, ; 87: Avalonia.Vulkan.dll => 183
	i64 u0x1db6820994506bf5, ; 88: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dbb0c2c6a999acb, ; 89: System.Diagnostics.StackTrace => 30
	i64 u0x1e1a605292ce6795, ; 90: Avalonia.Themes.Fluent => 191
	i64 u0x1e7c31185e2fb266, ; 91: lib_System.Threading.Tasks.Parallel.dll.so => 144
	i64 u0x1f055d15d807e1b2, ; 92: System.Xml.XmlSerializer => 163
	i64 u0x1f1ed22c1085f044, ; 93: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 94: lib_System.Numerics.dll.so => 84
	i64 u0x1f750bb5421397de, ; 95: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 236
	i64 u0x20237ea48006d7a8, ; 96: lib_System.Net.WebClient.dll.so => 77
	i64 u0x209375905fcc1bad, ; 97: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20fab3cf2dfbc8df, ; 98: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 99: System.Globalization => 42
	i64 u0x21419508838f7547, ; 100: System.Runtime.CompilerServices.VisualC => 103
	i64 u0x2174319c0d835bc9, ; 101: System.Runtime => 117
	i64 u0x2198e5bc8b7153fa, ; 102: Xamarin.AndroidX.Annotation.Experimental.dll => 206
	i64 u0x219ea1b751a4dee4, ; 103: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 104: System.Reflection.Emit.ILGeneration => 91
	i64 u0x224538d85ed15a82, ; 105: System.IO.Pipes => 56
	i64 u0x22908438c6bed1af, ; 106: lib_System.Threading.Timer.dll.so => 148
	i64 u0x22fbc14e981e3b45, ; 107: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 250
	i64 u0x237be844f1f812c7, ; 108: System.Threading.Thread.dll => 146
	i64 u0x23852b3bdc9f7096, ; 109: System.Resources.ResourceManager => 100
	i64 u0x23986dd7e5d4fc01, ; 110: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x2407aef2bbe8fadf, ; 111: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 112: Xamarin.AndroidX.Core.dll => 215
	i64 u0x247619fe4413f8bf, ; 113: System.Runtime.Serialization.Primitives.dll => 114
	i64 u0x2662c629b96b0b30, ; 114: lib_Xamarin.Kotlin.StdLib.dll.so => 243
	i64 u0x26a670e154a9c54b, ; 115: System.Reflection.Extensions.dll => 94
	i64 u0x26d077d9678fe34f, ; 116: System.IO.dll => 58
	i64 u0x2759af78ab94d39b, ; 117: System.Net.WebSockets => 81
	i64 u0x277e4a36150ed3a3, ; 118: Avalonia.Base.dll => 174
	i64 u0x27b410442fad6cf1, ; 119: Java.Interop.dll => 169
	i64 u0x27b97e0d52c3034a, ; 120: System.Diagnostics.Debug => 26
	i64 u0x27eb21c6eb99d774, ; 121: Xamarin.Kotlin.StdLib.Jdk8.dll => 246
	i64 u0x2801845a2c71fbfb, ; 122: System.Net.Primitives.dll => 71
	i64 u0x286835e259162700, ; 123: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 232
	i64 u0x2927d345f3daec35, ; 124: SkiaSharp.dll => 200
	i64 u0x2937d81e11ec0ddf, ; 125: Avalonia.Markup.Xaml.dll => 178
	i64 u0x29f947844fb7fc11, ; 126: Microsoft.Maui.Controls.HotReload.Forms => 249
	i64 u0x2a3b095612184159, ; 127: lib_System.Net.NetworkInformation.dll.so => 69
	i64 u0x2a6507a5ffabdf28, ; 128: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ad5d6b13b7a3e04, ; 129: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 130: System.Text.RegularExpressions.dll => 139
	i64 u0x2afc1c4f898552ee, ; 131: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b17908826439236, ; 132: Avalonia.Metal.dll => 180
	i64 u0x2b52706233239866, ; 133: Avalonia.Remote.Protocol.dll => 189
	i64 u0x2b6989d78cba9a15, ; 134: Xamarin.AndroidX.Concurrent.Futures.dll => 214
	i64 u0x2cbd9262ca785540, ; 135: lib_System.Text.Encoding.CodePages.dll.so => 134
	i64 u0x2cc9e1fed6257257, ; 136: lib_System.Reflection.Emit.Lightweight.dll.so => 92
	i64 u0x2cd723e9fe623c7c, ; 137: lib_System.Private.Xml.Linq.dll.so => 88
	i64 u0x2d169d318a968379, ; 138: System.Threading.dll => 149
	i64 u0x2d5ffcae1ad0aaca, ; 139: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 140: System.Text.Json.dll => 138
	i64 u0x2dcaa0bb15a4117a, ; 141: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e5a40c319acb800, ; 142: System.IO.FileSystem => 51
	i64 u0x2f02f94df3200fe5, ; 143: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 144: System.Xml.ReaderWriter => 157
	i64 u0x2f5911d9ba814e4e, ; 145: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 146: lib_System.Xml.dll.so => 164
	i64 u0x309ee9eeec09a71e, ; 147: lib_Xamarin.AndroidX.Fragment.dll.so => 223
	i64 u0x30c6dda129408828, ; 148: System.IO.IsolatedStorage => 52
	i64 u0x31195fef5d8fb552, ; 149: _Microsoft.Android.Resource.Designer.dll => 254
	i64 u0x31496b779ed0663d, ; 150: lib_System.Reflection.DispatchProxy.dll.so => 90
	i64 u0x3235427f8d12dae1, ; 151: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x32aa989ff07a84ff, ; 152: lib_System.Xml.ReaderWriter.dll.so => 157
	i64 u0x33829542f112d59b, ; 153: System.Collections.Immutable => 9
	i64 u0x341abc357fbb4ebf, ; 154: lib_System.Net.Sockets.dll.so => 76
	i64 u0x3496c1e2dcaf5ecc, ; 155: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x353590da528c9d22, ; 156: System.ComponentModel.Annotations => 13
	i64 u0x3552fc5d578f0fbf, ; 157: Xamarin.AndroidX.Arch.Core.Common => 210
	i64 u0x355c649948d55d97, ; 158: lib_System.Runtime.Intrinsics.dll.so => 109
	i64 u0x360a66b9f4afb47e, ; 159: ShimSkiaSharp => 199
	i64 u0x3628ab68db23a01a, ; 160: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x3673b042508f5b6b, ; 161: lib_System.Runtime.Extensions.dll.so => 104
	i64 u0x36740f1a8ecdc6c4, ; 162: System.Numerics => 84
	i64 u0x36b2b50fdf589ae2, ; 163: System.Reflection.Emit.Lightweight => 92
	i64 u0x36cada77dc79928b, ; 164: System.IO.MemoryMappedFiles => 53
	i64 u0x374ef46b06791af6, ; 165: System.Reflection.Primitives.dll => 96
	i64 u0x376bf93e521a5417, ; 166: lib_Xamarin.Jetbrains.Annotations.dll.so => 242
	i64 u0x37bc29f3183003b6, ; 167: lib_System.IO.dll.so => 58
	i64 u0x380134e03b1e160a, ; 168: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 169: System.Runtime.CompilerServices.Unsafe => 102
	i64 u0x385c17636bb6fe6e, ; 170: Xamarin.AndroidX.CustomView.dll => 219
	i64 u0x38869c811d74050e, ; 171: System.Net.NameResolution.dll => 68
	i64 u0x393c226616977fdb, ; 172: lib_Xamarin.AndroidX.ViewPager.dll.so => 240
	i64 u0x3a51880eea7585d2, ; 173: lib_Avalonia.Markup.Xaml.dll.so => 178
	i64 u0x3ab5859054645f72, ; 174: System.Security.Cryptography.Primitives.dll => 125
	i64 u0x3ad75090c3fac0e9, ; 175: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 233
	i64 u0x3ae44ac43a1fbdbb, ; 176: System.Runtime.Serialization => 116
	i64 u0x3b6f59802ed335c2, ; 177: Avalonia.MicroCom.dll => 181
	i64 u0x3b860f9932505633, ; 178: lib_System.Text.Encoding.Extensions.dll.so => 135
	i64 u0x3c3aafb6b3a00bf6, ; 179: lib_System.Security.Cryptography.X509Certificates.dll.so => 126
	i64 u0x3c4049146b59aa90, ; 180: System.Runtime.InteropServices.JavaScript => 106
	i64 u0x3c7c495f58ac5ee9, ; 181: Xamarin.Kotlin.StdLib => 243
	i64 u0x3c7e5ed3d5db71bb, ; 182: System.Security => 131
	i64 u0x3d1c50cc001a991e, ; 183: Xamarin.Google.Guava.ListenableFuture.dll => 241
	i64 u0x3d2b1913edfc08d7, ; 184: lib_System.Threading.ThreadPool.dll.so => 147
	i64 u0x3d46f0b995082740, ; 185: System.Xml.Linq => 156
	i64 u0x3d9c2a242b040a50, ; 186: lib_Xamarin.AndroidX.Core.dll.so => 215
	i64 u0x3e1d4f6aea0771d8, ; 187: lib_Avalonia.Diagnostics.dll.so => 187
	i64 u0x3e5441657549b213, ; 188: Xamarin.AndroidX.ResourceInspection.Annotation => 233
	i64 u0x3e57d4d195c53c2e, ; 189: System.Reflection.TypeExtensions => 97
	i64 u0x3e616ab4ed1f3f15, ; 190: lib_System.Data.dll.so => 24
	i64 u0x3f510adf788828dd, ; 191: System.Threading.Tasks.Extensions => 143
	i64 u0x40c98b6bd77346d4, ; 192: Microsoft.VisualBasic.dll => 3
	i64 u0x41833cf766d27d96, ; 193: mscorlib => 167
	i64 u0x41cab042be111c34, ; 194: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 209
	i64 u0x423a9ecc4d905a88, ; 195: lib_System.Resources.ResourceManager.dll.so => 100
	i64 u0x423bf51ae7def810, ; 196: System.Xml.XPath => 161
	i64 u0x42462ff15ddba223, ; 197: System.Resources.Reader.dll => 99
	i64 u0x42a31b86e6ccc3f0, ; 198: System.Diagnostics.Contracts => 25
	i64 u0x430e95b891249788, ; 199: lib_System.Reflection.Emit.dll.so => 93
	i64 u0x43375950ec7c1b6a, ; 200: netstandard.dll => 168
	i64 u0x434c4e1d9284cdae, ; 201: Mono.Android.dll => 172
	i64 u0x4362a90ce25cb6e1, ; 202: Avalonia.Diagnostics => 187
	i64 u0x437d06c381ed575a, ; 203: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43e8ca5bc927ff37, ; 204: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 222
	i64 u0x448bd33429269b19, ; 205: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 206: lib_System.Runtime.Serialization.Primitives.dll.so => 114
	i64 u0x4515080865a951a5, ; 207: Xamarin.Kotlin.StdLib.dll => 243
	i64 u0x454b4d1e66bb783c, ; 208: Xamarin.AndroidX.Lifecycle.Process => 227
	i64 u0x45aceb3561dbf4e7, ; 209: Svg.Custom => 201
	i64 u0x45c40276a42e283e, ; 210: System.Diagnostics.TraceSource => 33
	i64 u0x45d124f3a617a7d2, ; 211: lib_Svg.Custom.dll.so => 201
	i64 u0x45d443f2a29adc37, ; 212: System.AppContext.dll => 6
	i64 u0x47358bd471172e1d, ; 213: lib_System.Xml.Linq.dll.so => 156
	i64 u0x480c0a47dd42dd81, ; 214: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x4972c623c86d2c28, ; 215: lib_Avalonia.DesignerSupport.dll.so => 176
	i64 u0x49e952f19a4e2022, ; 216: System.ObjectModel => 85
	i64 u0x49f9e6948a8131e4, ; 217: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 239
	i64 u0x4a7a18981dbd56bc, ; 218: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4ab01d3ffaf3dd27, ; 219: lib_Avalonia.Dialogs.dll.so => 177
	i64 u0x4b07a0ed0ab33ff4, ; 220: System.Runtime.Extensions.dll => 104
	i64 u0x4b576d47ac054f3c, ; 221: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 222: System.Text.Json => 138
	i64 u0x4c7755cf07ad2d5f, ; 223: System.Net.Http.Json.dll => 64
	i64 u0x4ca7077b553ba065, ; 224: Avalonia.Controls => 175
	i64 u0x4cc5f15266470798, ; 225: lib_Xamarin.AndroidX.Loader.dll.so => 231
	i64 u0x4cf6f67dc77aacd2, ; 226: System.Net.NetworkInformation.dll => 69
	i64 u0x4d3183dd245425d4, ; 227: System.Net.WebSockets.Client.dll => 80
	i64 u0x4d447523346ce7e7, ; 228: lib_Svg.Skia.dll.so => 203
	i64 u0x4d479f968a05e504, ; 229: System.Linq.Expressions.dll => 59
	i64 u0x4d55a010ffc4faff, ; 230: System.Private.Xml => 89
	i64 u0x4d5cbe77561c5b2e, ; 231: System.Web.dll => 154
	i64 u0x4d77512dbd86ee4c, ; 232: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 210
	i64 u0x4d7793536e79c309, ; 233: System.ServiceProcess => 133
	i64 u0x4d95fccc1f67c7ca, ; 234: System.Runtime.Loader.dll => 110
	i64 u0x4dd9247f1d2c3235, ; 235: Xamarin.AndroidX.Loader.dll => 231
	i64 u0x4e2aeee78e2c4a87, ; 236: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 232
	i64 u0x4e32f00cb0937401, ; 237: Mono.Android.Runtime => 171
	i64 u0x4e5eea4668ac2b18, ; 238: System.Text.Encoding.CodePages => 134
	i64 u0x4ebd0c4b82c5eefc, ; 239: lib_System.Threading.Channels.dll.so => 140
	i64 u0x4ee8eaa9c9c1151a, ; 240: System.Globalization.Calendars => 40
	i64 u0x50c3a29b21050d45, ; 241: System.Linq.Parallel.dll => 60
	i64 u0x50ed43b4a9b11edd, ; 242: MicroCom.Runtime => 196
	i64 u0x5112ed116d87baf8, ; 243: CommunityToolkit.Mvvm => 193
	i64 u0x516324a5050a7e3c, ; 244: System.Net.WebProxy => 79
	i64 u0x516d6f0b21a303de, ; 245: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 246: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 247: System.Resources.Reader => 99
	i64 u0x526ce79eb8e90527, ; 248: lib_System.Net.Primitives.dll.so => 71
	i64 u0x52829f00b4467c38, ; 249: lib_System.Data.Common.dll.so => 22
	i64 u0x529ffe06f39ab8db, ; 250: Xamarin.AndroidX.Core => 215
	i64 u0x53978aac584c666e, ; 251: lib_System.Security.Cryptography.Cng.dll.so => 121
	i64 u0x53a96d5c86c9e194, ; 252: System.Net.NetworkInformation => 69
	i64 u0x53be1038a61e8d44, ; 253: System.Runtime.InteropServices.RuntimeInformation.dll => 107
	i64 u0x5435e6f049e9bc37, ; 254: System.Security.Claims.dll => 119
	i64 u0x54470ccf96ae985a, ; 255: Avalonia.Themes.Simple.dll => 192
	i64 u0x54795225dd1587af, ; 256: lib_System.Runtime.dll.so => 117
	i64 u0x547a34f14e5f6210, ; 257: Xamarin.AndroidX.Lifecycle.Common.dll => 225
	i64 u0x5588627c9a108ec9, ; 258: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 259: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 260: lib_System.Security.Cryptography.OpenSsl.dll.so => 124
	i64 u0x56442b99bc64bb47, ; 261: System.Runtime.Serialization.Xml.dll => 115
	i64 u0x56a8b26e1aeae27b, ; 262: System.Threading.Tasks.Dataflow => 142
	i64 u0x56f932d61e93c07f, ; 263: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 264: System.Private.Uri => 87
	i64 u0x576499c9f52fea31, ; 265: Xamarin.AndroidX.Annotation => 205
	i64 u0x579a06fed6eec900, ; 266: System.Private.CoreLib.dll => 173
	i64 u0x57c542c14049b66d, ; 267: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 268: System.Threading.Timer => 148
	i64 u0x58688d9af496b168, ; 269: Microsoft.Extensions.DependencyInjection.dll => 197
	i64 u0x595a356d23e8da9a, ; 270: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59f9e60b9475085f, ; 271: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 206
	i64 u0x5a27319ca17d5e68, ; 272: MicroCom.Runtime.dll => 196
	i64 u0x5a745f5101a75527, ; 273: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a8f6699f4a1caa9, ; 274: lib_System.Threading.dll.so => 149
	i64 u0x5a9765194c545c9a, ; 275: Zavrsni.Android => 0
	i64 u0x5ae9cd33b15841bf, ; 276: System.ComponentModel => 18
	i64 u0x5b1e476818ceaf8c, ; 277: lib_Avalonia.Themes.Simple.dll.so => 192
	i64 u0x5b54391bdc6fcfe6, ; 278: System.Private.DataContractSerialization => 86
	i64 u0x5b8109e8e14c5e3e, ; 279: System.Globalization.Extensions.dll => 41
	i64 u0x5bdf16b09da116ab, ; 280: Xamarin.AndroidX.Collection => 212
	i64 u0x5bf46208bead7b18, ; 281: ShimSkiaSharp.dll => 199
	i64 u0x5bff6a70194300bd, ; 282: lib_Xamarin.Kotlin.StdLib.Jdk8.dll.so => 246
	i64 u0x5c30a4a35f9cc8c4, ; 283: lib_System.Reflection.Extensions.dll.so => 94
	i64 u0x5c53c29f5073b0c9, ; 284: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 285: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 286: System.Net.WebHeaderCollection.dll => 78
	i64 u0x5d40c9b15181641f, ; 287: lib_Xamarin.AndroidX.Emoji2.dll.so => 221
	i64 u0x5d6ca10d35e9485b, ; 288: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 214
	i64 u0x5d7ec76c1c703055, ; 289: System.Threading.Tasks.Parallel => 144
	i64 u0x5db0cbbd1028510e, ; 290: lib_System.Runtime.InteropServices.dll.so => 108
	i64 u0x5db30905d3e5013b, ; 291: Xamarin.AndroidX.Collection.Jvm.dll => 213
	i64 u0x5e361f1dfaff19f1, ; 292: Avalonia.Fonts.Inter.dll => 188
	i64 u0x5e467bc8f09ad026, ; 293: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 294: System.Runtime.Handles.dll => 105
	i64 u0x5ea92fdb19ec8c4c, ; 295: System.Text.Encodings.Web.dll => 137
	i64 u0x5eb8046dd40e9ac3, ; 296: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 297: System.Security.Cryptography.Csp.dll => 122
	i64 u0x5eee1376d94c7f5e, ; 298: System.Net.HttpListener.dll => 66
	i64 u0x5f36ccf5c6a57e24, ; 299: System.Xml.ReaderWriter.dll => 157
	i64 u0x5f3bce5c22261fd2, ; 300: ExCSS.dll => 194
	i64 u0x5f4294b9b63cb842, ; 301: System.Data.Common => 22
	i64 u0x5fac98e0b37a5b9d, ; 302: System.Runtime.CompilerServices.Unsafe.dll => 102
	i64 u0x609f4b7b63d802d4, ; 303: lib_Microsoft.Extensions.DependencyInjection.dll.so => 197
	i64 u0x60cd4e33d7e60134, ; 304: Xamarin.KotlinX.Coroutines.Core.Jvm => 248
	i64 u0x60f62d786afcf130, ; 305: System.Memory => 63
	i64 u0x61bb78c89f867353, ; 306: System.IO => 58
	i64 u0x61d88f399afb2f45, ; 307: lib_System.Runtime.Loader.dll.so => 110
	i64 u0x61f3f147709e029a, ; 308: Zavrsni.Android.dll => 0
	i64 u0x622eef6f9e59068d, ; 309: System.Private.CoreLib => 173
	i64 u0x6376ee64ab136329, ; 310: lib_Avalonia.Themes.Fluent.dll.so => 191
	i64 u0x63cdbd66ac39bb46, ; 311: lib_Microsoft.VisualStudio.DesignTools.XamlTapContract.dll.so => 252
	i64 u0x63d5e3aa4ef9b931, ; 312: Xamarin.KotlinX.Coroutines.Android.dll => 247
	i64 u0x63f1f6883c1e23c2, ; 313: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x640e3b14dbd325c2, ; 314: System.Security.Cryptography.Algorithms.dll => 120
	i64 u0x641c60df5c993ae3, ; 315: Avalonia.DesignerSupport => 176
	i64 u0x64587004560099b9, ; 316: System.Reflection => 98
	i64 u0x64b1529a438a3c45, ; 317: lib_System.Runtime.Handles.dll.so => 105
	i64 u0x65ece51227bfa724, ; 318: lib_System.Runtime.Numerics.dll.so => 111
	i64 u0x661722438787b57f, ; 319: Xamarin.AndroidX.Annotation.Jvm.dll => 207
	i64 u0x6679b2337ee6b22a, ; 320: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x6692e924eade1b29, ; 321: lib_System.Console.dll.so => 20
	i64 u0x66d13304ce1a3efa, ; 322: Xamarin.AndroidX.CursorAdapter => 218
	i64 u0x674303f65d8fad6f, ; 323: lib_System.Net.Quic.dll.so => 72
	i64 u0x67c0802770244408, ; 324: System.Windows.dll => 155
	i64 u0x68100b69286e27cd, ; 325: lib_System.Formats.Tar.dll.so => 39
	i64 u0x6872ec7a2e36b1ac, ; 326: System.Drawing.Primitives.dll => 35
	i64 u0x68fbbbe2eb455198, ; 327: System.Formats.Asn1 => 38
	i64 u0x6a4d7577b2317255, ; 328: System.Runtime.InteropServices.dll => 108
	i64 u0x6afcedb171067e2b, ; 329: System.Core.dll => 21
	i64 u0x6b08bb626d38c6a4, ; 330: Avalonia.Controls.ColorPicker.dll => 186
	i64 u0x6bef98e124147c24, ; 331: Xamarin.Jetbrains.Annotations => 242
	i64 u0x6ce874bff138ce2b, ; 332: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 229
	i64 u0x6d70755158ca866e, ; 333: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d7eeca99577fc8b, ; 334: lib_System.Net.WebProxy.dll.so => 79
	i64 u0x6d8515b19946b6a2, ; 335: System.Net.WebProxy.dll => 79
	i64 u0x6d86d56b84c8eb71, ; 336: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 218
	i64 u0x6e838d9a2a6f6c9e, ; 337: lib_System.ValueTuple.dll.so => 152
	i64 u0x6e9965ce1095e60a, ; 338: lib_System.Core.dll.so => 21
	i64 u0x6ffc4967cc47ba57, ; 339: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 340: System.IO.FileSystem.dll => 51
	i64 u0x70c1154d9ce7bd51, ; 341: Xamarin.Kotlin.StdLib.Common.dll => 244
	i64 u0x71485e7ffdb4b958, ; 342: System.Reflection.Extensions => 94
	i64 u0x71ad672adbe48f35, ; 343: System.ComponentModel.Primitives.dll => 16
	i64 u0x725f5a9e82a45c81, ; 344: System.Security.Cryptography.Encoding => 123
	i64 u0x72e0300099accce1, ; 345: System.Xml.XPath.XDocument => 160
	i64 u0x730bfb248998f67a, ; 346: System.IO.Compression.ZipFile => 45
	i64 u0x73a6be34e822f9d1, ; 347: lib_System.Runtime.Serialization.dll.so => 116
	i64 u0x73e4ce94e2eb6ffc, ; 348: lib_System.Memory.dll.so => 63
	i64 u0x743a1eccf080489a, ; 349: WindowsBase.dll => 166
	i64 u0x7503ac24fcf8095e, ; 350: Xamarin.AndroidX.Core.SplashScreen.dll => 217
	i64 u0x75c326eb821b85c4, ; 351: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 352: lib_Xamarin.AndroidX.SavedState.dll.so => 234
	i64 u0x76ca07b878f44da0, ; 353: System.Runtime.Numerics.dll => 111
	i64 u0x7736c8a96e51a061, ; 354: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 207
	i64 u0x778a805e625329ef, ; 355: System.Linq.Parallel => 60
	i64 u0x77f8a4acc2fdc449, ; 356: System.Security.Cryptography.Cng.dll => 121
	i64 u0x782c5d8eb99ff201, ; 357: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x78979a5b2d9eda26, ; 358: Avalonia.OpenGL => 182
	i64 u0x78a45e51311409b6, ; 359: Xamarin.AndroidX.Fragment.dll => 223
	i64 u0x78ed4ab8f9d800a1, ; 360: Xamarin.AndroidX.Lifecycle.ViewModel => 229
	i64 u0x7a7e7eddf79c5d26, ; 361: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 229
	i64 u0x7a9a57d43b0845fa, ; 362: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 363: Xamarin.AndroidX.Collection.dll => 212
	i64 u0x7bef86a4335c4870, ; 364: System.ComponentModel.TypeConverter => 17
	i64 u0x7c41d387501568ba, ; 365: System.Net.WebClient.dll => 77
	i64 u0x7c915d27bc4afbdb, ; 366: Xamarin.AndroidX.Core.SplashScreen => 217
	i64 u0x7cd2ec8eaf5241cd, ; 367: System.Security.dll => 131
	i64 u0x7cf9ae50dd350622, ; 368: Xamarin.Jetbrains.Annotations.dll => 242
	i64 u0x7d14464ae904af64, ; 369: lib_Avalonia.Metal.dll.so => 180
	i64 u0x7d8ee2bdc8e3aad1, ; 370: System.Numerics.Vectors => 83
	i64 u0x7dfc3d6d9d8d7b70, ; 371: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 372: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 373: lib_System.Security.Claims.dll.so => 119
	i64 u0x7e571cad5915e6c3, ; 374: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 227
	i64 u0x7e6b1ca712437d7d, ; 375: Xamarin.AndroidX.Emoji2.ViewsHelper => 222
	i64 u0x7e946809d6008ef2, ; 376: lib_System.ObjectModel.dll.so => 85
	i64 u0x7ecc13347c8fd849, ; 377: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 378: Xamarin.AndroidX.ViewPager.dll => 240
	i64 u0x7fbd557c99b3ce6f, ; 379: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 226
	i64 u0x803f1de6fe44738a, ; 380: lib_Avalonia.dll.so => 184
	i64 u0x8076a9a44a2ca331, ; 381: System.Net.Quic => 72
	i64 u0x80b7e726b0280681, ; 382: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 250
	i64 u0x80da183a87731838, ; 383: System.Reflection.Metadata => 95
	i64 u0x812c069d5cdecc17, ; 384: System.dll => 165
	i64 u0x81381be520a60adb, ; 385: Xamarin.AndroidX.Interpolator.dll => 224
	i64 u0x81657cec2b31e8aa, ; 386: System.Net => 82
	i64 u0x8277f2be6b5ce05f, ; 387: Xamarin.AndroidX.AppCompat => 208
	i64 u0x82b399cb01b531c4, ; 388: lib_System.Web.dll.so => 154
	i64 u0x82df8f5532a10c59, ; 389: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 390: lib_System.Transactions.dll.so => 151
	i64 u0x8308a506644563bb, ; 391: Avalonia.Metal => 180
	i64 u0x846ce984efea52c7, ; 392: System.Threading.Tasks.Parallel.dll => 144
	i64 u0x84ae73148a4557d2, ; 393: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 394: System.Runtime.Serialization.Json.dll => 113
	i64 u0x84f9060cc4a93c8f, ; 395: lib_SkiaSharp.dll.so => 200
	i64 u0x850c5ba0b57ce8e7, ; 396: lib_Xamarin.AndroidX.Collection.dll.so => 212
	i64 u0x851d02edd334b044, ; 397: Xamarin.AndroidX.VectorDrawable => 237
	i64 u0x8662aaeb94fef37f, ; 398: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x8690556019b686eb, ; 399: Svg.Custom.dll => 201
	i64 u0x86b5381885cbbb52, ; 400: lib_Svg.Model.dll.so => 202
	i64 u0x86b62cb077ec4fd7, ; 401: System.Runtime.Serialization.Xml => 115
	i64 u0x8706ffb12bf3f53d, ; 402: Xamarin.AndroidX.Annotation.Experimental => 206
	i64 u0x872a5b14c18d328c, ; 403: System.ComponentModel.DataAnnotations => 14
	i64 u0x87c69b87d9283884, ; 404: lib_System.Threading.Thread.dll.so => 146
	i64 u0x87f6569b25707834, ; 405: System.IO.Compression.Brotli.dll => 43
	i64 u0x8808a9d7c53dc4c0, ; 406: lib_HarfBuzzSharp.dll.so => 195
	i64 u0x88ba6bc4f7762b03, ; 407: lib_System.Reflection.dll.so => 98
	i64 u0x88bda98e0cffb7a9, ; 408: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 248
	i64 u0x8930322c7bd8f768, ; 409: netstandard => 168
	i64 u0x897a606c9e39c75f, ; 410: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x89911a22005b92b7, ; 411: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 412: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 107
	i64 u0x8a19e3dc71b34b2c, ; 413: System.Reflection.TypeExtensions.dll => 97
	i64 u0x8a21b916d9796fa5, ; 414: Avalonia.MicroCom => 181
	i64 u0x8ad229ea26432ee2, ; 415: Xamarin.AndroidX.Loader => 231
	i64 u0x8b4ff5d0fdd5faa1, ; 416: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 417: System.Security.Principal.Windows => 128
	i64 u0x8b8d01333a96d0b5, ; 418: System.Diagnostics.Process.dll => 29
	i64 u0x8cdfdb4ce85fb925, ; 419: lib_System.Security.Principal.Windows.dll.so => 128
	i64 u0x8cdfe7b8f4caa426, ; 420: System.IO.Compression.FileSystem => 44
	i64 u0x8d0f420977c2c1c7, ; 421: Xamarin.AndroidX.CursorAdapter.dll => 218
	i64 u0x8d52f7ea2796c531, ; 422: Xamarin.AndroidX.Emoji2.dll => 221
	i64 u0x8d7b8ab4b3310ead, ; 423: System.Threading => 149
	i64 u0x8da188285aadfe8e, ; 424: System.Collections.Concurrent => 8
	i64 u0x8f44b45eb046bbd1, ; 425: System.ServiceModel.Web.dll => 132
	i64 u0x8fb4480c06374c78, ; 426: lib_Avalonia.Android.dll.so => 185
	i64 u0x8fbf5b0114c6dcef, ; 427: System.Globalization.dll => 42
	i64 u0x90263f8448b8f572, ; 428: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 429: _Microsoft.Android.Resource.Designer => 254
	i64 u0x90393bd4865292f3, ; 430: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 431: System.Threading.Tasks.Extensions.dll => 143
	i64 u0x91418dc638b29e68, ; 432: lib_Xamarin.AndroidX.CustomView.dll.so => 219
	i64 u0x9157bd523cd7ed36, ; 433: lib_System.Text.Json.dll.so => 138
	i64 u0x91a74f07b30d37e2, ; 434: System.Linq.dll => 62
	i64 u0x91cb86ea3b17111d, ; 435: System.ServiceModel.Web => 132
	i64 u0x92054e486c0c7ea7, ; 436: System.IO.FileSystem.DriveInfo => 48
	i64 u0x9216ea747d0be31f, ; 437: lib_Avalonia.Controls.dll.so => 175
	i64 u0x9246426168cfbd4a, ; 438: Avalonia.Dialogs.dll => 177
	i64 u0x928614058c40c4cd, ; 439: lib_System.Xml.XPath.XDocument.dll.so => 160
	i64 u0x92b138fffca2b01e, ; 440: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 211
	i64 u0x9388aad9b7ae40ce, ; 441: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 225
	i64 u0x944077d8ca3c6580, ; 442: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 443: System.Xml => 164
	i64 u0x94c8990839c4bdb1, ; 444: lib_Xamarin.AndroidX.Interpolator.dll.so => 224
	i64 u0x96a7347adc67c496, ; 445: lib_Avalonia.Skia.dll.so => 190
	i64 u0x96cfafe6410410d8, ; 446: lib_Avalonia.Vulkan.dll.so => 183
	i64 u0x9799aee8e42cced3, ; 447: Avalonia.Skia.dll => 190
	i64 u0x97b8c771ea3e4220, ; 448: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 449: System.Collections.Concurrent.dll => 8
	i64 u0x9843944103683dd3, ; 450: Xamarin.AndroidX.Core.Core.Ktx => 216
	i64 u0x98d720cc4597562c, ; 451: System.Security.Cryptography.OpenSsl => 124
	i64 u0x991d510397f92d9d, ; 452: System.Linq.Expressions => 59
	i64 u0x996ceeb8a3da3d67, ; 453: System.Threading.Overlapped.dll => 141
	i64 u0x999cb19e1a04ffd3, ; 454: CommunityToolkit.Mvvm.dll => 193
	i64 u0x9a01b1da98b6ee10, ; 455: Xamarin.AndroidX.Lifecycle.Runtime.dll => 228
	i64 u0x9b211a749105beac, ; 456: System.Transactions.Local => 150
	i64 u0x9b68e31c09020a8f, ; 457: Avalonia.Markup.dll => 179
	i64 u0x9b8734714671022d, ; 458: System.Threading.Tasks.Dataflow.dll => 142
	i64 u0x9c244ac7cda32d26, ; 459: System.Security.Cryptography.X509Certificates.dll => 126
	i64 u0x9c465f280cf43733, ; 460: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 247
	i64 u0x9c8f6872beab6408, ; 461: System.Xml.XPath.XDocument.dll => 160
	i64 u0x9ce01cf91101ae23, ; 462: System.Xml.XmlDocument => 162
	i64 u0x9d5dbcf5a48583fe, ; 463: lib_Xamarin.AndroidX.Activity.dll.so => 204
	i64 u0x9e4b95dec42769f7, ; 464: System.Diagnostics.Debug.dll => 26
	i64 u0x9ef542cf1f78c506, ; 465: Xamarin.AndroidX.Lifecycle.LiveData.Core => 226
	i64 u0x9f9c5c252feedc26, ; 466: Avalonia.OpenGL.dll => 182
	i64 u0xa00832eb975f56a8, ; 467: lib_System.Net.dll.so => 82
	i64 u0xa08c521f3ed09e51, ; 468: Zavrsni => 253
	i64 u0xa0d8259f4cc284ec, ; 469: lib_System.Security.Cryptography.dll.so => 127
	i64 u0xa0ff9b3e34d92f11, ; 470: lib_System.Resources.Writer.dll.so => 101
	i64 u0xa12fbfb4da97d9f3, ; 471: System.Threading.Timer.dll => 148
	i64 u0xa2572680829d2c7c, ; 472: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 473: System.Xml.XmlDocument.dll => 162
	i64 u0xa28642c7ac33c167, ; 474: Avalonia.Markup => 179
	i64 u0xa308401900e5bed3, ; 475: lib_mscorlib.dll.so => 167
	i64 u0xa395572e7da6c99d, ; 476: lib_System.Security.dll.so => 131
	i64 u0xa3e683f24b43af6f, ; 477: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 478: Xamarin.AndroidX.VectorDrawable.Animated => 238
	i64 u0xa4d20d2ff0563d26, ; 479: lib_CommunityToolkit.Mvvm.dll.so => 193
	i64 u0xa4edc8f2ceae241a, ; 480: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 481: System.Runtime.Serialization.Formatters.dll => 112
	i64 u0xa54b74df83dce92b, ; 482: System.Reflection.DispatchProxy => 90
	i64 u0xa5b7152421ed6d98, ; 483: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 484: lib_System.Linq.Parallel.dll.so => 60
	i64 u0xa5ce5c755bde8cb8, ; 485: lib_System.Security.Cryptography.Csp.dll.so => 122
	i64 u0xa5e599d1e0524750, ; 486: System.Numerics.Vectors.dll => 83
	i64 u0xa5f1ba49b85dd355, ; 487: System.Security.Cryptography.dll => 127
	i64 u0xa61975a5a37873ea, ; 488: lib_System.Xml.XmlSerializer.dll.so => 163
	i64 u0xa6645e3d03867094, ; 489: Svg.Skia => 203
	i64 u0xa66cbee0130865f7, ; 490: lib_WindowsBase.dll.so => 166
	i64 u0xa67dbee13e1df9ca, ; 491: Xamarin.AndroidX.SavedState.dll => 234
	i64 u0xa68a420042bb9b1f, ; 492: Xamarin.AndroidX.DrawerLayout.dll => 220
	i64 u0xa763fbb98df8d9fb, ; 493: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa7eab29ed44b4e7a, ; 494: Mono.Android.Export => 170
	i64 u0xa8195217cbf017b7, ; 495: Microsoft.VisualBasic.Core => 2
	i64 u0xa8b52f21e0dbe690, ; 496: System.Runtime.Serialization.dll => 116
	i64 u0xa8c84ce526c2b4bd, ; 497: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 252
	i64 u0xa8ee4ed7de2efaee, ; 498: Xamarin.AndroidX.Annotation.dll => 205
	i64 u0xa95590e7c57438a4, ; 499: System.Configuration => 19
	i64 u0xaa443ac34067eeef, ; 500: System.Private.Xml.dll => 89
	i64 u0xaa52de307ef5d1dd, ; 501: System.Net.Http => 65
	i64 u0xaa9a7b0214a5cc5c, ; 502: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 503: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 198
	i64 u0xab9c1b2687d86b0b, ; 504: lib_System.Linq.Expressions.dll.so => 59
	i64 u0xac2af3fa195a15ce, ; 505: System.Runtime.Numerics => 111
	i64 u0xac5376a2a538dc10, ; 506: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 226
	i64 u0xac5acae88f60357e, ; 507: System.Diagnostics.Tools.dll => 32
	i64 u0xac79c7e46047ad98, ; 508: System.Security.Principal.Windows.dll => 128
	i64 u0xac98d31068e24591, ; 509: System.Xml.XDocument => 159
	i64 u0xacdd9e4180d56dda, ; 510: Xamarin.AndroidX.Concurrent.Futures => 214
	i64 u0xacf42eea7ef9cd12, ; 511: System.Threading.Channels => 140
	i64 u0xadbb53caf78a79d2, ; 512: System.Web.HttpUtility => 153
	i64 u0xadc90ab061a9e6e4, ; 513: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadf4cf30debbeb9a, ; 514: System.Net.ServicePoint.dll => 75
	i64 u0xadf511667bef3595, ; 515: System.Net.Security => 74
	i64 u0xae0aaa94fdcfce0f, ; 516: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 517: Java.Interop => 169
	i64 u0xae53579c90db1107, ; 518: System.ObjectModel.dll => 85
	i64 u0xaf732d0b2193b8f5, ; 519: System.Security.Cryptography.OpenSsl.dll => 124
	i64 u0xafe29f45095518e7, ; 520: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 230
	i64 u0xb0bb43dc52ea59f9, ; 521: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 522: System.Security.AccessControl => 118
	i64 u0xb220631954820169, ; 523: System.Text.RegularExpressions => 139
	i64 u0xb2376e1dbf8b4ed7, ; 524: System.Security.Cryptography.Csp => 122
	i64 u0xb24e06ce97f7b2bf, ; 525: Svg.Model.dll => 202
	i64 u0xb2a1959fe95c5402, ; 526: lib_System.Runtime.InteropServices.JavaScript.dll.so => 106
	i64 u0xb3011a0a57f7ffb2, ; 527: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 250
	i64 u0xb3874072ee0ecf8c, ; 528: Xamarin.AndroidX.VectorDrawable.Animated.dll => 238
	i64 u0xb4bd7015ecee9d86, ; 529: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 530: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 531: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb5c38bf497a4cfe2, ; 532: lib_System.Threading.Tasks.dll.so => 145
	i64 u0xb5e2ea1bb00704d6, ; 533: Xamarin.Kotlin.StdLib.Jdk7.dll => 245
	i64 u0xb5ea31d5244c6626, ; 534: System.Threading.ThreadPool.dll => 147
	i64 u0xb66575354464a3ec, ; 535: Xamarin.Kotlin.StdLib.Common => 244
	i64 u0xb7212c4683a94afe, ; 536: System.Drawing.Primitives => 35
	i64 u0xb76fec8889890d92, ; 537: lib_Xamarin.AndroidX.Core.SplashScreen.dll.so => 217
	i64 u0xb81a2c6e0aee50fe, ; 538: lib_System.Private.CoreLib.dll.so => 173
	i64 u0xb8c60af47c08d4da, ; 539: System.Net.ServicePoint => 75
	i64 u0xb8e68d20aad91196, ; 540: lib_System.Xml.XPath.dll.so => 161
	i64 u0xb9185c33a1643eed, ; 541: Microsoft.CSharp.dll => 1
	i64 u0xba4670aa94a2b3c6, ; 542: lib_System.Xml.XDocument.dll.so => 159
	i64 u0xba48785529705af9, ; 543: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 544: lib_System.Windows.dll.so => 155
	i64 u0xbb286883bc35db36, ; 545: System.Transactions.dll => 151
	i64 u0xbb65706fde942ce3, ; 546: System.Net.Sockets => 76
	i64 u0xbba28979413cad9e, ; 547: lib_System.Runtime.CompilerServices.VisualC.dll.so => 103
	i64 u0xbbd180354b67271a, ; 548: System.Runtime.Serialization.Formatters => 112
	i64 u0xbc260cdba33291a3, ; 549: Xamarin.AndroidX.Arch.Core.Common.dll => 210
	i64 u0xbcc7a047ca7ce896, ; 550: Avalonia.Diagnostics.dll => 187
	i64 u0xbd0e2c0d55246576, ; 551: System.Net.Http.dll => 65
	i64 u0xbd3fbd85b9e1cb29, ; 552: lib_System.Net.HttpListener.dll.so => 66
	i64 u0xbd4f572d2bd0a789, ; 553: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd877b14d0b56392, ; 554: System.Runtime.Intrinsics.dll => 109
	i64 u0xbe65a49036345cf4, ; 555: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 556: Xamarin.AndroidX.AppCompat.AppCompatResources => 209
	i64 u0xbef9919db45b4ca7, ; 557: System.IO.Pipes.AccessControl => 55
	i64 u0xbf0fa68611139208, ; 558: lib_Xamarin.AndroidX.Annotation.dll.so => 205
	i64 u0xbfc1e1fb3095f2b3, ; 559: lib_System.Net.Http.Json.dll.so => 64
	i64 u0xc07cadab29efeba0, ; 560: Xamarin.AndroidX.Core.Core.Ktx.dll => 216
	i64 u0xc0d928351ab5ca77, ; 561: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 562: System.Runtime.Intrinsics => 109
	i64 u0xc111030af54d7191, ; 563: System.Resources.Writer => 101
	i64 u0xc12b8b3afa48329c, ; 564: lib_System.Linq.dll.so => 62
	i64 u0xc183ca0b74453aa9, ; 565: lib_System.Threading.Tasks.Dataflow.dll.so => 142
	i64 u0xc1ff9ae3cdb6e1e6, ; 566: Xamarin.AndroidX.Activity.dll => 204
	i64 u0xc26c064effb1dea9, ; 567: System.Buffers.dll => 7
	i64 u0xc2902f6cf5452577, ; 568: lib_Mono.Android.Export.dll.so => 170
	i64 u0xc2a3bca55b573141, ; 569: System.IO.FileSystem.Watcher => 50
	i64 u0xc30b52815b58ac2c, ; 570: lib_System.Runtime.Serialization.Xml.dll.so => 115
	i64 u0xc36d7d89c652f455, ; 571: System.Threading.Overlapped => 141
	i64 u0xc3c86c1e5e12f03d, ; 572: WindowsBase => 166
	i64 u0xc421b61fd853169d, ; 573: lib_System.Net.WebSockets.Client.dll.so => 80
	i64 u0xc463e077917aa21d, ; 574: System.Runtime.Serialization.Json => 113
	i64 u0xc4d3858ed4d08512, ; 575: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 230
	i64 u0xc4f72c53a5b1ad3e, ; 576: Avalonia.Android.dll => 185
	i64 u0xc50fded0ded1418c, ; 577: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 578: lib_System.Net.Requests.dll.so => 73
	i64 u0xc5325b2fcb37446f, ; 579: lib_System.Private.Xml.dll.so => 89
	i64 u0xc5a0f4b95a699af7, ; 580: lib_System.Private.Uri.dll.so => 87
	i64 u0xc5cdcd5b6277579e, ; 581: lib_System.Security.Cryptography.Algorithms.dll.so => 120
	i64 u0xc5ec286825cb0bf4, ; 582: Xamarin.AndroidX.Tracing.Tracing => 236
	i64 u0xc6068c73a3554082, ; 583: Avalonia.Fonts.Inter => 188
	i64 u0xc6706bc8aa7fe265, ; 584: Xamarin.AndroidX.Annotation.Jvm => 207
	i64 u0xc674822f2d239e99, ; 585: lib_Avalonia.Markup.dll.so => 179
	i64 u0xc7c01e7d7c93a110, ; 586: System.Text.Encoding.Extensions.dll => 135
	i64 u0xc7ce851898a4548e, ; 587: lib_System.Web.HttpUtility.dll.so => 153
	i64 u0xc809d4089d2556b2, ; 588: System.Runtime.InteropServices.JavaScript.dll => 106
	i64 u0xc858a28d9ee5a6c5, ; 589: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 590: System.Reflection.DispatchProxy.dll => 90
	i64 u0xc9c62c8f354ac568, ; 591: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xca5801070d9fccfb, ; 592: System.Text.Encoding => 136
	i64 u0xcadbc92899a777f0, ; 593: Xamarin.AndroidX.Startup.StartupRuntime => 235
	i64 u0xcb281152a61ad34a, ; 594: lib_Zavrsni.dll.so => 253
	i64 u0xcbb5f80c7293e696, ; 595: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 596: lib__Microsoft.Android.Resource.Designer.dll.so => 254
	i64 u0xcc2876b32ef2794c, ; 597: lib_System.Text.RegularExpressions.dll.so => 139
	i64 u0xcc5c3bb714c4561e, ; 598: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 248
	i64 u0xcc9fa2923aa1c9ef, ; 599: System.Diagnostics.Contracts.dll => 25
	i64 u0xcd10a42808629144, ; 600: System.Net.Requests => 73
	i64 u0xcdca1b920e9f53ba, ; 601: Xamarin.AndroidX.Interpolator => 224
	i64 u0xcde1fa22dc303670, ; 602: Microsoft.VisualStudio.DesignTools.XamlTapContract => 252
	i64 u0xceef1924dde133c4, ; 603: Zavrsni.dll => 253
	i64 u0xcf23d8093f3ceadf, ; 604: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 605: System.Net.Mail.dll => 67
	i64 u0xcf8fc898f98b0d34, ; 606: System.Private.Xml.Linq => 88
	i64 u0xd04b5f59ed596e31, ; 607: System.Reflection.Metadata.dll => 95
	i64 u0xd063299fcfc0c93f, ; 608: lib_System.Runtime.Serialization.Json.dll.so => 113
	i64 u0xd0de8a113e976700, ; 609: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 610: System.Runtime.Extensions => 104
	i64 u0xd1268c6d5c152eea, ; 611: lib_Avalonia.OpenGL.dll.so => 182
	i64 u0xd12beacdfc14f696, ; 612: System.Dynamic.Runtime => 37
	i64 u0xd198e7ce1b6a8344, ; 613: System.Net.Quic.dll => 72
	i64 u0xd3144156a3727ebe, ; 614: Xamarin.Google.Guava.ListenableFuture => 241
	i64 u0xd333d0af9e423810, ; 615: System.Runtime.InteropServices => 108
	i64 u0xd33a415cb4278969, ; 616: System.Security.Cryptography.Encoding.dll => 123
	i64 u0xd3426d966bb704f5, ; 617: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 209
	i64 u0xd3651b6fc3125825, ; 618: System.Private.Uri.dll => 87
	i64 u0xd3801faafafb7698, ; 619: System.Private.DataContractSerialization.dll => 86
	i64 u0xd3edcc1f25459a50, ; 620: System.Reflection.Emit => 93
	i64 u0xd45462df8fe5e800, ; 621: lib_MicroCom.Runtime.dll.so => 196
	i64 u0xd4645626dffec99d, ; 622: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 198
	i64 u0xd4fa0abb79079ea9, ; 623: System.Security.Principal.dll => 129
	i64 u0xd5507e11a2b2839f, ; 624: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 230
	i64 u0xd5d04bef8478ea19, ; 625: Xamarin.AndroidX.Tracing.Tracing.dll => 236
	i64 u0xd65786d27a4ad960, ; 626: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 249
	i64 u0xd6694f8359737e4e, ; 627: Xamarin.AndroidX.SavedState => 234
	i64 u0xd6949e129339eae5, ; 628: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 216
	i64 u0xd72c760af136e863, ; 629: System.Xml.XmlSerializer.dll => 163
	i64 u0xd753f071e44c2a03, ; 630: lib_System.Security.SecureString.dll.so => 130
	i64 u0xd7f0088bc5ad71f2, ; 631: Xamarin.AndroidX.VersionedParcelable => 239
	i64 u0xd88b5f5bbc332508, ; 632: Avalonia.Base => 174
	i64 u0xd8fb25e28ae30a12, ; 633: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 232
	i64 u0xda1dfa4c534a9251, ; 634: Microsoft.Extensions.DependencyInjection => 197
	i64 u0xdad05a11827959a3, ; 635: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 636: System.IO.FileSystem.Primitives => 49
	i64 u0xdb1b4b8779f49288, ; 637: lib_Avalonia.MicroCom.dll.so => 181
	i64 u0xdb58816721c02a59, ; 638: lib_System.Reflection.Emit.ILGeneration.dll.so => 91
	i64 u0xdbf2a779fbc3ac31, ; 639: System.Transactions.Local.dll => 150
	i64 u0xdbf9607a441b4505, ; 640: System.Linq => 62
	i64 u0xdbfc90157a0de9b0, ; 641: lib_System.Text.Encoding.dll.so => 136
	i64 u0xdc75032002d1a212, ; 642: lib_System.Transactions.Local.dll.so => 150
	i64 u0xdca8be7403f92d4f, ; 643: lib_System.Linq.Queryable.dll.so => 61
	i64 u0xdd2b722d78ef5f43, ; 644: System.Runtime.dll => 117
	i64 u0xdd67031857c72f96, ; 645: lib_System.Text.Encodings.Web.dll.so => 137
	i64 u0xdd92e229ad292030, ; 646: System.Numerics.dll => 84
	i64 u0xde110ae80fa7c2e2, ; 647: System.Xml.XDocument.dll => 159
	i64 u0xde572c2b2fb32f93, ; 648: lib_System.Threading.Tasks.Extensions.dll.so => 143
	i64 u0xdf4b773de8fb1540, ; 649: System.Net.dll => 82
	i64 u0xdfa254ebb4346068, ; 650: System.Net.Ping => 70
	i64 u0xdfcf7a2e1456e0b6, ; 651: Avalonia.Themes.Simple => 192
	i64 u0xdfefe13b112aff31, ; 652: lib_Avalonia.Base.dll.so => 174
	i64 u0xe0142572c095a480, ; 653: Xamarin.AndroidX.AppCompat.dll => 208
	i64 u0xe021eaa401792a05, ; 654: System.Text.Encoding.dll => 136
	i64 u0xe10b760bb1462e7a, ; 655: lib_System.Security.Cryptography.Primitives.dll.so => 125
	i64 u0xe1566bbdb759c5af, ; 656: Microsoft.Maui.Controls.HotReload.Forms.dll => 249
	i64 u0xe192a588d4410686, ; 657: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 658: System.Runtime.Loader => 110
	i64 u0xe1a77eb8831f7741, ; 659: System.Security.SecureString.dll => 130
	i64 u0xe1b52f9f816c70ef, ; 660: System.Private.Xml.Linq.dll => 88
	i64 u0xe1e199c8ab02e356, ; 661: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 662: System.Net.Security.dll => 74
	i64 u0xe2252a80fe853de4, ; 663: lib_System.Security.Principal.dll.so => 129
	i64 u0xe22fa4c9c645db62, ; 664: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe2420585aeceb728, ; 665: System.Net.Requests.dll => 73
	i64 u0xe2ad448dee50fbdf, ; 666: System.Xml.Serialization => 158
	i64 u0xe2d920f978f5d85c, ; 667: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 668: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 669: Mono.Android.Export.dll => 170
	i64 u0xe38f2586e1a6af0e, ; 670: Avalonia.Controls.dll => 175
	i64 u0xe3b7cbae5ad66c75, ; 671: lib_System.Security.Cryptography.Encoding.dll.so => 123
	i64 u0xe4648f9beb38b02f, ; 672: Avalonia => 184
	i64 u0xe4f74a0b5bf9703f, ; 673: System.Runtime.Serialization.Primitives => 114
	i64 u0xe5434e8a119ceb69, ; 674: lib_Mono.Android.dll.so => 172
	i64 u0xe55703b9ce5c038a, ; 675: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 676: Microsoft.VisualBasic => 3
	i64 u0xe62913cc36bc07ec, ; 677: System.Xml.dll => 164
	i64 u0xe67ddaf3b05935e8, ; 678: lib_Avalonia.Remote.Protocol.dll.so => 189
	i64 u0xe7bea09c4900a191, ; 679: Xamarin.AndroidX.VectorDrawable.dll => 237
	i64 u0xe7e03cc18dcdeb49, ; 680: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 681: lib_System.Configuration.dll.so => 19
	i64 u0xe83ddbccfc6aff3f, ; 682: Xamarin.Kotlin.StdLib.Jdk7 => 245
	i64 u0xe896622fe0902957, ; 683: System.Reflection.Emit.dll => 93
	i64 u0xe89a2a9ef110899b, ; 684: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 685: Microsoft.Win32.Registry => 5
	i64 u0xe93e919ce2b08636, ; 686: lib_ExCSS.dll.so => 194
	i64 u0xe98163eb702ae5c5, ; 687: Xamarin.AndroidX.Arch.Core.Runtime => 211
	i64 u0xe994f23ba4c143e5, ; 688: Xamarin.KotlinX.Coroutines.Android => 247
	i64 u0xe9b9c8c0458fd92a, ; 689: System.Windows => 155
	i64 u0xe9d166d87a7f2bdb, ; 690: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 235
	i64 u0xed19c616b3fcb7eb, ; 691: Xamarin.AndroidX.VersionedParcelable.dll => 239
	i64 u0xed60c6fa891c051a, ; 692: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 251
	i64 u0xedc4817167106c23, ; 693: System.Net.Sockets.dll => 76
	i64 u0xedc632067fb20ff3, ; 694: System.Memory.dll => 63
	i64 u0xee81f5b3f1c4f83b, ; 695: System.Threading.ThreadPool => 147
	i64 u0xeeb7ebb80150501b, ; 696: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 213
	i64 u0xeefc635595ef57f0, ; 697: System.Security.Cryptography.Cng => 121
	i64 u0xef03b1b5a04e9709, ; 698: System.Text.Encoding.CodePages.dll => 134
	i64 u0xef602c523fe2e87a, ; 699: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 241
	i64 u0xefd1e0c4e5c9b371, ; 700: System.Resources.ResourceManager.dll => 100
	i64 u0xefe8f8d5ed3c72ea, ; 701: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 702: Xamarin.AndroidX.Activity => 204
	i64 u0xf09e47b6ae914f6e, ; 703: System.Net.NameResolution => 68
	i64 u0xf0ac2b489fed2e35, ; 704: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 705: lib_System.Net.ServicePoint.dll.so => 75
	i64 u0xf0de2537ee19c6ca, ; 706: lib_System.Net.WebHeaderCollection.dll.so => 78
	i64 u0xf1138779fa181c68, ; 707: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 228
	i64 u0xf153c4e48695a352, ; 708: lib_Avalonia.Controls.ColorPicker.dll.so => 186
	i64 u0xf161f4f3c3b7e62c, ; 709: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 710: System.ValueTuple => 152
	i64 u0xf1c4b4005493d871, ; 711: System.Formats.Asn1.dll => 38
	i64 u0xf2a69492c6bd46b0, ; 712: lib_Xamarin.Kotlin.StdLib.Jdk7.dll.so => 245
	i64 u0xf2feea356ba760af, ; 713: Xamarin.AndroidX.Arch.Core.Runtime.dll => 211
	i64 u0xf300e085f8acd238, ; 714: lib_System.ServiceProcess.dll.so => 133
	i64 u0xf34e52b26e7e059d, ; 715: System.Runtime.CompilerServices.VisualC.dll => 103
	i64 u0xf368e771ca059e99, ; 716: Avalonia.Android => 185
	i64 u0xf3ad9b8fb3eefd12, ; 717: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 718: System => 165
	i64 u0xf408654b2a135055, ; 719: System.Reflection.Emit.ILGeneration.dll => 91
	i64 u0xf4103170a1de5bd0, ; 720: System.Linq.Queryable.dll => 61
	i64 u0xf42d20c23173d77c, ; 721: lib_System.ServiceModel.Web.dll.so => 132
	i64 u0xf4727d423e5d26f3, ; 722: SkiaSharp => 200
	i64 u0xf4c1dd70a5496a17, ; 723: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 724: System.ServiceProcess.dll => 133
	i64 u0xf518f63ead11fcd1, ; 725: System.Threading.Tasks => 145
	i64 u0xf57137e5984abfa8, ; 726: Avalonia.dll => 184
	i64 u0xf5fc7602fe27b333, ; 727: System.Net.WebHeaderCollection => 78
	i64 u0xf70c0a7bf8ccf5af, ; 728: System.Web => 154
	i64 u0xf7e2cac4c45067b3, ; 729: lib_System.Numerics.Vectors.dll.so => 83
	i64 u0xf8aac5ea82de1348, ; 730: System.Linq.Queryable => 61
	i64 u0xf8b77539b362d3ba, ; 731: lib_System.Reflection.Primitives.dll.so => 96
	i64 u0xf915dc29808193a1, ; 732: System.Web.HttpUtility.dll => 153
	i64 u0xf9ae35b3d65d7bb8, ; 733: Avalonia.Themes.Fluent.dll => 191
	i64 u0xf9be54c8bcf8ff3b, ; 734: System.Security.AccessControl.dll => 118
	i64 u0xfa0e82300e67f913, ; 735: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 736: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 737: lib_System.Net.Security.dll.so => 74
	i64 u0xfa645d91e9fc4cba, ; 738: System.Threading.Thread => 146
	i64 u0xfad4d2c770e827f9, ; 739: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb06dd2338e6f7c4, ; 740: System.Net.Ping.dll => 70
	i64 u0xfb087abe5365e3b7, ; 741: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb846e949baff5ea, ; 742: System.Xml.Serialization.dll => 158
	i64 u0xfbad3e4ce4b98145, ; 743: System.Security.Cryptography.X509Certificates => 126
	i64 u0xfbe99333ee5a53d9, ; 744: Avalonia.Vulkan => 183
	i64 u0xfbf0a31c9fc34bc4, ; 745: lib_System.Net.Http.dll.so => 65
	i64 u0xfc0ee5ac47a00750, ; 746: ExCSS => 194
	i64 u0xfc4186c2448201c7, ; 747: Avalonia.Dialogs => 177
	i64 u0xfc6b7527cc280b3f, ; 748: lib_System.Runtime.Serialization.Formatters.dll.so => 112
	i64 u0xfc70c50e7e4385e2, ; 749: Avalonia.Skia => 190
	i64 u0xfc82690c2fe2735c, ; 750: Xamarin.AndroidX.Lifecycle.Process.dll => 227
	i64 u0xfc93fc307d279893, ; 751: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 752: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfd22f00870e40ae0, ; 753: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 220
	i64 u0xfd49b3c1a76e2748, ; 754: System.Runtime.InteropServices.RuntimeInformation => 107
	i64 u0xfd536c702f64dc47, ; 755: System.Text.Encoding.Extensions => 135
	i64 u0xfd583f7657b6a1cb, ; 756: Xamarin.AndroidX.Fragment => 223
	i64 u0xfd8dd91a2c26bd5d, ; 757: Xamarin.AndroidX.Lifecycle.Runtime => 228
	i64 u0xfda36abccf05cf5c, ; 758: System.Net.WebSockets.Client => 80
	i64 u0xfddbe9695626a7f5, ; 759: Xamarin.AndroidX.Lifecycle.Common => 225
	i64 u0xfeca84fe7f34860b, ; 760: HarfBuzzSharp.dll => 195
	i64 u0xff270a55858bac8d, ; 761: System.Security.Principal => 129
	i64 u0xff9b54613e0d2cc8, ; 762: System.Net.Http.Json => 64
	i64 u0xffb5607c2db1b7e8, ; 763: Xamarin.Kotlin.StdLib.Jdk8 => 246
	i64 u0xffdb7a971be4ec73 ; 764: System.ValueTuple.dll => 152
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [765 x i32] [
	i32 42, i32 13, i32 105, i32 171, i32 48, i32 208, i32 7, i32 86,
	i32 244, i32 71, i32 12, i32 203, i32 102, i32 195, i32 156, i32 19,
	i32 213, i32 161, i32 222, i32 237, i32 167, i32 10, i32 238, i32 96,
	i32 220, i32 13, i32 10, i32 127, i32 95, i32 188, i32 140, i32 39,
	i32 240, i32 172, i32 5, i32 67, i32 199, i32 130, i32 0, i32 202,
	i32 221, i32 68, i32 66, i32 57, i32 219, i32 52, i32 43, i32 125,
	i32 67, i32 81, i32 251, i32 158, i32 92, i32 99, i32 141, i32 151,
	i32 162, i32 169, i32 198, i32 81, i32 251, i32 4, i32 5, i32 51,
	i32 101, i32 56, i32 120, i32 98, i32 168, i32 118, i32 21, i32 189,
	i32 137, i32 97, i32 77, i32 235, i32 119, i32 176, i32 8, i32 165,
	i32 70, i32 233, i32 171, i32 145, i32 40, i32 178, i32 186, i32 183,
	i32 47, i32 30, i32 191, i32 144, i32 163, i32 28, i32 84, i32 236,
	i32 77, i32 43, i32 29, i32 42, i32 103, i32 117, i32 206, i32 45,
	i32 91, i32 56, i32 148, i32 250, i32 146, i32 100, i32 49, i32 20,
	i32 215, i32 114, i32 243, i32 94, i32 58, i32 81, i32 174, i32 169,
	i32 26, i32 246, i32 71, i32 232, i32 200, i32 178, i32 249, i32 69,
	i32 33, i32 14, i32 139, i32 38, i32 180, i32 189, i32 214, i32 134,
	i32 92, i32 88, i32 149, i32 24, i32 138, i32 57, i32 51, i32 29,
	i32 157, i32 34, i32 164, i32 223, i32 52, i32 254, i32 90, i32 35,
	i32 157, i32 9, i32 76, i32 55, i32 13, i32 210, i32 109, i32 199,
	i32 32, i32 104, i32 84, i32 92, i32 53, i32 96, i32 242, i32 58,
	i32 9, i32 102, i32 219, i32 68, i32 240, i32 178, i32 125, i32 233,
	i32 116, i32 181, i32 135, i32 126, i32 106, i32 243, i32 131, i32 241,
	i32 147, i32 156, i32 215, i32 187, i32 233, i32 97, i32 24, i32 143,
	i32 3, i32 167, i32 209, i32 100, i32 161, i32 99, i32 25, i32 93,
	i32 168, i32 172, i32 187, i32 3, i32 222, i32 1, i32 114, i32 243,
	i32 227, i32 201, i32 33, i32 201, i32 6, i32 156, i32 53, i32 176,
	i32 85, i32 239, i32 44, i32 177, i32 104, i32 47, i32 138, i32 64,
	i32 175, i32 231, i32 69, i32 80, i32 203, i32 59, i32 89, i32 154,
	i32 210, i32 133, i32 110, i32 231, i32 232, i32 171, i32 134, i32 140,
	i32 40, i32 60, i32 196, i32 193, i32 79, i32 25, i32 36, i32 99,
	i32 71, i32 22, i32 215, i32 121, i32 69, i32 107, i32 119, i32 192,
	i32 117, i32 225, i32 11, i32 2, i32 124, i32 115, i32 142, i32 41,
	i32 87, i32 205, i32 173, i32 27, i32 148, i32 197, i32 1, i32 206,
	i32 196, i32 44, i32 149, i32 0, i32 18, i32 192, i32 86, i32 41,
	i32 212, i32 199, i32 246, i32 94, i32 28, i32 41, i32 78, i32 221,
	i32 214, i32 144, i32 108, i32 213, i32 188, i32 11, i32 105, i32 137,
	i32 16, i32 122, i32 66, i32 157, i32 194, i32 22, i32 102, i32 197,
	i32 248, i32 63, i32 58, i32 110, i32 0, i32 173, i32 191, i32 252,
	i32 247, i32 9, i32 120, i32 176, i32 98, i32 105, i32 111, i32 207,
	i32 49, i32 20, i32 218, i32 72, i32 155, i32 39, i32 35, i32 38,
	i32 108, i32 21, i32 186, i32 242, i32 229, i32 15, i32 79, i32 79,
	i32 218, i32 152, i32 21, i32 50, i32 51, i32 244, i32 94, i32 16,
	i32 123, i32 160, i32 45, i32 116, i32 63, i32 166, i32 217, i32 14,
	i32 234, i32 111, i32 207, i32 60, i32 121, i32 2, i32 182, i32 223,
	i32 229, i32 229, i32 6, i32 212, i32 17, i32 77, i32 217, i32 131,
	i32 242, i32 180, i32 83, i32 12, i32 34, i32 119, i32 227, i32 222,
	i32 85, i32 18, i32 240, i32 226, i32 184, i32 72, i32 250, i32 95,
	i32 165, i32 224, i32 82, i32 208, i32 154, i32 36, i32 151, i32 180,
	i32 144, i32 56, i32 113, i32 200, i32 212, i32 237, i32 37, i32 201,
	i32 202, i32 115, i32 206, i32 14, i32 146, i32 43, i32 195, i32 98,
	i32 248, i32 168, i32 16, i32 48, i32 107, i32 97, i32 181, i32 231,
	i32 27, i32 128, i32 29, i32 128, i32 44, i32 218, i32 221, i32 149,
	i32 8, i32 132, i32 185, i32 42, i32 33, i32 254, i32 46, i32 143,
	i32 219, i32 138, i32 62, i32 132, i32 48, i32 175, i32 177, i32 160,
	i32 211, i32 225, i32 46, i32 164, i32 224, i32 190, i32 183, i32 190,
	i32 18, i32 8, i32 216, i32 124, i32 59, i32 141, i32 193, i32 228,
	i32 150, i32 179, i32 142, i32 126, i32 247, i32 160, i32 162, i32 204,
	i32 26, i32 226, i32 182, i32 82, i32 253, i32 127, i32 101, i32 148,
	i32 54, i32 162, i32 179, i32 167, i32 131, i32 37, i32 238, i32 193,
	i32 22, i32 112, i32 90, i32 50, i32 60, i32 122, i32 83, i32 127,
	i32 163, i32 203, i32 166, i32 234, i32 220, i32 4, i32 170, i32 2,
	i32 116, i32 252, i32 205, i32 19, i32 89, i32 65, i32 30, i32 198,
	i32 59, i32 111, i32 226, i32 32, i32 128, i32 159, i32 214, i32 140,
	i32 153, i32 17, i32 75, i32 74, i32 15, i32 169, i32 85, i32 124,
	i32 230, i32 34, i32 118, i32 139, i32 122, i32 202, i32 106, i32 250,
	i32 238, i32 54, i32 47, i32 28, i32 145, i32 245, i32 147, i32 244,
	i32 35, i32 217, i32 173, i32 75, i32 161, i32 1, i32 159, i32 12,
	i32 155, i32 151, i32 76, i32 103, i32 112, i32 210, i32 187, i32 65,
	i32 66, i32 45, i32 109, i32 7, i32 209, i32 55, i32 205, i32 64,
	i32 216, i32 20, i32 109, i32 101, i32 62, i32 142, i32 204, i32 7,
	i32 170, i32 50, i32 115, i32 141, i32 166, i32 80, i32 113, i32 230,
	i32 185, i32 17, i32 73, i32 89, i32 87, i32 120, i32 236, i32 188,
	i32 207, i32 179, i32 135, i32 153, i32 106, i32 11, i32 90, i32 31,
	i32 136, i32 235, i32 253, i32 40, i32 254, i32 139, i32 248, i32 25,
	i32 73, i32 224, i32 252, i32 253, i32 27, i32 67, i32 88, i32 95,
	i32 113, i32 31, i32 104, i32 182, i32 37, i32 72, i32 241, i32 108,
	i32 123, i32 209, i32 87, i32 86, i32 93, i32 196, i32 198, i32 129,
	i32 230, i32 236, i32 249, i32 234, i32 216, i32 163, i32 130, i32 239,
	i32 174, i32 232, i32 197, i32 10, i32 49, i32 181, i32 91, i32 150,
	i32 62, i32 136, i32 150, i32 61, i32 117, i32 137, i32 84, i32 159,
	i32 143, i32 82, i32 70, i32 192, i32 174, i32 208, i32 136, i32 125,
	i32 249, i32 54, i32 110, i32 130, i32 88, i32 23, i32 74, i32 129,
	i32 31, i32 73, i32 158, i32 23, i32 4, i32 170, i32 175, i32 123,
	i32 184, i32 114, i32 172, i32 32, i32 3, i32 164, i32 189, i32 237,
	i32 30, i32 19, i32 245, i32 93, i32 36, i32 5, i32 194, i32 211,
	i32 247, i32 155, i32 235, i32 239, i32 251, i32 76, i32 63, i32 147,
	i32 213, i32 121, i32 134, i32 241, i32 100, i32 39, i32 204, i32 68,
	i32 26, i32 75, i32 78, i32 228, i32 186, i32 24, i32 152, i32 38,
	i32 245, i32 211, i32 133, i32 103, i32 185, i32 57, i32 165, i32 91,
	i32 61, i32 132, i32 200, i32 46, i32 133, i32 145, i32 184, i32 78,
	i32 154, i32 83, i32 61, i32 96, i32 153, i32 191, i32 118, i32 6,
	i32 15, i32 74, i32 146, i32 52, i32 70, i32 23, i32 158, i32 126,
	i32 183, i32 65, i32 194, i32 177, i32 112, i32 190, i32 227, i32 55,
	i32 53, i32 220, i32 107, i32 135, i32 223, i32 228, i32 80, i32 225,
	i32 195, i32 129, i32 64, i32 246, i32 152
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 9abff7703206541fdb83ffa80fe2c2753ad1997b"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
