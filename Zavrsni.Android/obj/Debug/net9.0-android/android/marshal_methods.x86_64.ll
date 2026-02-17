; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [324 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [972 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 42
	i64 u0x0024d0f62dee05bd, ; 1: Xamarin.KotlinX.Coroutines.Core.dll => 316
	i64 u0x01109b0e4d99e61f, ; 2: System.ComponentModel.Annotations.dll => 13
	i64 u0x02827b47e97f2378, ; 3: System.Security.Cryptography.Pkcs.dll => 265
	i64 u0x0284512fad379f7e, ; 4: System.Runtime.Handles => 105
	i64 u0x0297093beda3df86, ; 5: Supabase.Gotrue.dll => 255
	i64 u0x02a4c5a44384f885, ; 6: Microsoft.Extensions.Caching.Memory => 220
	i64 u0x02abedc11addc1ed, ; 7: lib_Mono.Android.Runtime.dll.so => 171
	i64 u0x02f55bf70672f5c8, ; 8: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 9: lib_Xamarin.AndroidX.AppCompat.dll.so => 272
	i64 u0x033a1d0324ba06bd, ; 10: Microsoft.IO.RecyclableMemoryStream.dll => 239
	i64 u0x03621c804933a890, ; 11: System.Buffers => 7
	i64 u0x0363ac97a4cb84e6, ; 12: SQLitePCLRaw.provider.e_sqlite3.dll => 251
	i64 u0x0377283fc1d7573a, ; 13: Microsoft.AspNetCore.DataProtection.Abstractions.dll => 205
	i64 u0x0399610510a38a38, ; 14: lib_System.Private.DataContractSerialization.dll.so => 86
	i64 u0x0470607fd33c32db, ; 15: Microsoft.IdentityModel.Abstractions.dll => 235
	i64 u0x0517ef04e06e9f76, ; 16: System.Net.Primitives => 71
	i64 u0x057bf9fa9fb09f7c, ; 17: Microsoft.Data.Sqlite.dll => 214
	i64 u0x0581db89237110e9, ; 18: lib_System.Collections.dll.so => 12
	i64 u0x05a0cd02a6c1cd3c, ; 19: Svg.Skia.dll => 262
	i64 u0x05a1c25e78e22d87, ; 20: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 102
	i64 u0x05c27cf2b380bbf2, ; 21: lib_Microsoft.AspNetCore.Hosting.Server.Abstractions.dll.so => 207
	i64 u0x05ef98b6a1db882c, ; 22: lib_Microsoft.Data.Sqlite.dll.so => 214
	i64 u0x0600544dd3961080, ; 23: HarfBuzzSharp => 195
	i64 u0x06388ffe9f6c161a, ; 24: System.Xml.Linq.dll => 156
	i64 u0x06600c4c124cb358, ; 25: System.Configuration.dll => 19
	i64 u0x0680a433c781bb3d, ; 26: Xamarin.AndroidX.Collection.Jvm => 277
	i64 u0x069fff96ec92a91d, ; 27: System.Xml.XPath.dll => 161
	i64 u0x070b0847e18dab68, ; 28: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 286
	i64 u0x072496def57d8011, ; 29: Microsoft.Extensions.WebEncoders.dll => 234
	i64 u0x0739448d84d3b016, ; 30: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 304
	i64 u0x07469f2eecce9e85, ; 31: mscorlib.dll => 167
	i64 u0x07dcdc7460a0c5e4, ; 32: System.Collections.NonGeneric => 10
	i64 u0x088610fc2509f69e, ; 33: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 305
	i64 u0x08a7c865576bbde7, ; 34: System.Reflection.Primitives => 96
	i64 u0x08f3c9788ee2153c, ; 35: Xamarin.AndroidX.DrawerLayout => 284
	i64 u0x09138715c92dba90, ; 36: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 37: lib_Microsoft.Extensions.Options.dll.so => 232
	i64 u0x092266563089ae3e, ; 38: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x09d144a7e214d457, ; 39: System.Security.Cryptography => 127
	i64 u0x09d931c8a4087ae3, ; 40: lib_Microsoft.AspNetCore.DataProtection.Abstractions.dll.so => 205
	i64 u0x09e2b9f743db21a8, ; 41: lib_System.Reflection.Metadata.dll.so => 95
	i64 u0x0a78a8431e4734f8, ; 42: lib_Avalonia.Fonts.Inter.dll.so => 188
	i64 u0x0a805f95d98f597b, ; 43: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 219
	i64 u0x0a980941fa112bc4, ; 44: System.Security.Cryptography.Xml => 266
	i64 u0x0abb3e2b271edc45, ; 45: System.Threading.Channels.dll => 140
	i64 u0x0b06b1feab070143, ; 46: System.Formats.Tar => 39
	i64 u0x0be1e582d0d8ef1a, ; 47: lib_Microsoft.AspNetCore.Cryptography.KeyDerivation.dll.so => 203
	i64 u0x0be2e1f8ce4064ed, ; 48: Xamarin.AndroidX.ViewPager => 307
	i64 u0x0c59ad9fbbd43abe, ; 49: Mono.Android => 172
	i64 u0x0c74af560004e816, ; 50: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c83c82812e96127, ; 51: lib_System.Net.Mail.dll.so => 67
	i64 u0x0cfd116e78cbc305, ; 52: lib_ShimSkiaSharp.dll.so => 246
	i64 u0x0d13cd7cce4284e4, ; 53: System.Security.SecureString => 130
	i64 u0x0d34fb076d8103ae, ; 54: Microsoft.Extensions.Identity.Core.dll => 228
	i64 u0x0d50068b8aee1b51, ; 55: lib_Zavrsni.Android.dll.so => 0
	i64 u0x0d518d16a10d1bcf, ; 56: Supabase.Functions => 254
	i64 u0x0d5c95da1348bb1c, ; 57: Svg.Model => 261
	i64 u0x0e04e702012f8463, ; 58: Xamarin.AndroidX.Emoji2 => 285
	i64 u0x0e14e73a54dda68e, ; 59: lib_System.Net.NameResolution.dll.so => 68
	i64 u0x0e2e96803ecb3446, ; 60: Supabase.Storage => 258
	i64 u0x0eae9eda7720a8db, ; 61: lib_Sentry.dll.so => 243
	i64 u0x0f5e7abaa7cf470a, ; 62: System.Net.HttpListener => 66
	i64 u0x0f948418e9ebd6de, ; 63: Microsoft.AspNetCore.Hosting.Abstractions.dll => 206
	i64 u0x0fc6e5711dabb83e, ; 64: lib_Supabase.Realtime.dll.so => 257
	i64 u0x1001f97bbe242e64, ; 65: System.IO.UnmanagedMemoryStream => 57
	i64 u0x102a31b45304b1da, ; 66: Xamarin.AndroidX.CustomView => 283
	i64 u0x1065c4cb554c3d75, ; 67: System.IO.IsolatedStorage.dll => 52
	i64 u0x10f6cfcbcf801616, ; 68: System.IO.Compression.Brotli => 43
	i64 u0x1140109eb2e77ceb, ; 69: Microsoft.Extensions.ObjectPool.dll => 231
	i64 u0x114443cdcf2091f1, ; 70: System.Security.Cryptography.Primitives => 125
	i64 u0x11a603952763e1d4, ; 71: System.Net.Mail => 67
	i64 u0x11a70d0e1009fb11, ; 72: System.Net.WebSockets.dll => 81
	i64 u0x11fbe62d469cc1c8, ; 73: Microsoft.VisualStudio.DesignTools.TapContract.dll => 320
	i64 u0x12128b3f59302d47, ; 74: lib_System.Xml.Serialization.dll.so => 158
	i64 u0x123639456fb056da, ; 75: System.Reflection.Emit.Lightweight.dll => 92
	i64 u0x124f38a5d8cb5fb8, ; 76: K4os.Compression.LZ4.dll => 196
	i64 u0x12521e9764603eaa, ; 77: lib_System.Resources.Reader.dll.so => 99
	i64 u0x12d3b63863d4ab0b, ; 78: lib_System.Threading.Overlapped.dll.so => 141
	i64 u0x134eab1061c395ee, ; 79: System.Transactions => 151
	i64 u0x13beedefb0e28a45, ; 80: lib_System.Xml.XmlDocument.dll.so => 162
	i64 u0x13f1e5e209e91af4, ; 81: lib_Java.Interop.dll.so => 169
	i64 u0x143d8ea60a6a4011, ; 82: Microsoft.Extensions.DependencyInjection.Abstractions => 223
	i64 u0x1497051b917530bd, ; 83: lib_System.Net.WebSockets.dll.so => 81
	i64 u0x14b78ce3adce0011, ; 84: Microsoft.VisualStudio.DesignTools.TapContract => 320
	i64 u0x152a448bd1e745a7, ; 85: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 86: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x15bdc156ed462f2f, ; 87: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 88: System.Resources.Writer.dll => 101
	i64 u0x15f86a17c58b9b2f, ; 89: lib_Svg.Controls.Skia.Avalonia.dll.so => 259
	i64 u0x16054fdcb6b3098b, ; 90: Microsoft.Extensions.DependencyModel.dll => 224
	i64 u0x16bf2a22df043a09, ; 91: System.IO.Pipes.dll => 56
	i64 u0x16ea2b318ad2d830, ; 92: System.Security.Cryptography.Algorithms => 120
	i64 u0x16eeae54c7ebcc08, ; 93: System.Reflection.dll => 98
	i64 u0x17125c9a85b4929f, ; 94: lib_netstandard.dll.so => 168
	i64 u0x1716866f7416792e, ; 95: lib_System.Security.AccessControl.dll.so => 118
	i64 u0x174f71c46216e44a, ; 96: Xamarin.KotlinX.Coroutines.Core => 316
	i64 u0x1752c12f1e1fc00c, ; 97: System.Core => 21
	i64 u0x17f10bff77f05b2e, ; 98: Avalonia.Remote.Protocol => 189
	i64 u0x17f9358913beb16a, ; 99: System.Text.Encodings.Web => 137
	i64 u0x1809fb23f29ba44a, ; 100: lib_System.Reflection.TypeExtensions.dll.so => 97
	i64 u0x18a9befae51bb361, ; 101: System.Net.WebClient => 77
	i64 u0x19777fba3c41b398, ; 102: Xamarin.AndroidX.Startup.StartupRuntime.dll => 302
	i64 u0x19a4c090f14ebb66, ; 103: System.Security.Claims => 119
	i64 u0x1a63352be1054efd, ; 104: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 207
	i64 u0x1a86fbe2485a9f00, ; 105: Avalonia.DesignerSupport.dll => 176
	i64 u0x1a91866a319e9259, ; 106: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 107: lib_System.dll.so => 165
	i64 u0x1aea8f1c3b282172, ; 108: lib_System.Net.Ping.dll.so => 70
	i64 u0x1bc766e07b2b4241, ; 109: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 300
	i64 u0x1bea5a36aa1ed8de, ; 110: Microsoft.AspNetCore.Http.Extensions => 210
	i64 u0x1c753b5ff15bce1b, ; 111: Mono.Android.Runtime.dll => 171
	i64 u0x1cd47467799d8250, ; 112: System.Threading.Tasks.dll => 145
	i64 u0x1d23eafdc6dc346c, ; 113: System.Globalization.Calendars.dll => 40
	i64 u0x1d3dd0218cdc9fa5, ; 114: Avalonia.Markup.Xaml => 178
	i64 u0x1d711378718cece2, ; 115: Avalonia.Controls.ColorPicker => 186
	i64 u0x1da87c3fe68efc1d, ; 116: Avalonia.Vulkan.dll => 183
	i64 u0x1db6820994506bf5, ; 117: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dbb0c2c6a999acb, ; 118: System.Diagnostics.StackTrace => 30
	i64 u0x1e1a605292ce6795, ; 119: Avalonia.Themes.Fluent => 191
	i64 u0x1e57ec3104eb59d9, ; 120: lib_Supabase.Gotrue.dll.so => 255
	i64 u0x1e7c31185e2fb266, ; 121: lib_System.Threading.Tasks.Parallel.dll.so => 144
	i64 u0x1ed8fcce5e9b50a0, ; 122: Microsoft.Extensions.Options.dll => 232
	i64 u0x1f055d15d807e1b2, ; 123: System.Xml.XmlSerializer => 163
	i64 u0x1f198ea93d5594b5, ; 124: Microsoft.Extensions.Identity.Core => 228
	i64 u0x1f1ed22c1085f044, ; 125: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 126: lib_System.Numerics.dll.so => 84
	i64 u0x1f6fc92d7360be95, ; 127: Sentry.Android.AssemblyReader.dll => 244
	i64 u0x1f750bb5421397de, ; 128: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 303
	i64 u0x20237ea48006d7a8, ; 129: lib_System.Net.WebClient.dll.so => 77
	i64 u0x209375905fcc1bad, ; 130: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20aa4eb4c5cf3260, ; 131: Supabase.Realtime.dll => 257
	i64 u0x20fab3cf2dfbc8df, ; 132: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 133: System.Globalization => 42
	i64 u0x21419508838f7547, ; 134: System.Runtime.CompilerServices.VisualC => 103
	i64 u0x2174319c0d835bc9, ; 135: System.Runtime => 117
	i64 u0x2198e5bc8b7153fa, ; 136: Xamarin.AndroidX.Annotation.Experimental.dll => 270
	i64 u0x219ea1b751a4dee4, ; 137: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 138: System.Reflection.Emit.ILGeneration => 91
	i64 u0x224538d85ed15a82, ; 139: System.IO.Pipes => 56
	i64 u0x22908438c6bed1af, ; 140: lib_System.Threading.Timer.dll.so => 148
	i64 u0x22fbc14e981e3b45, ; 141: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 319
	i64 u0x234b2420fe4b9bdc, ; 142: lib_K4os.Compression.LZ4.dll.so => 196
	i64 u0x237be844f1f812c7, ; 143: System.Threading.Thread.dll => 146
	i64 u0x23807c59646ec4f3, ; 144: lib_Microsoft.EntityFrameworkCore.dll.so => 215
	i64 u0x23852b3bdc9f7096, ; 145: System.Resources.ResourceManager => 100
	i64 u0x23986dd7e5d4fc01, ; 146: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x2407aef2bbe8fadf, ; 147: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 148: Xamarin.AndroidX.Core.dll => 279
	i64 u0x24441218506eabcc, ; 149: lib_Sentry.Bindings.Android.dll.so => 245
	i64 u0x247619fe4413f8bf, ; 150: System.Runtime.Serialization.Primitives.dll => 114
	i64 u0x25a0a7eff76ea08e, ; 151: SQLitePCLRaw.batteries_v2.dll => 248
	i64 u0x2662c629b96b0b30, ; 152: lib_Xamarin.Kotlin.StdLib.dll.so => 310
	i64 u0x268c1439f13bcc29, ; 153: lib_Microsoft.Extensions.Primitives.dll.so => 233
	i64 u0x26a670e154a9c54b, ; 154: System.Reflection.Extensions.dll => 94
	i64 u0x26d077d9678fe34f, ; 155: System.IO.dll => 58
	i64 u0x270a44600c921861, ; 156: System.IdentityModel.Tokens.Jwt => 263
	i64 u0x2759af78ab94d39b, ; 157: System.Net.WebSockets => 81
	i64 u0x277e4a36150ed3a3, ; 158: Avalonia.Base.dll => 174
	i64 u0x27b410442fad6cf1, ; 159: Java.Interop.dll => 169
	i64 u0x27b97e0d52c3034a, ; 160: System.Diagnostics.Debug => 26
	i64 u0x27eb21c6eb99d774, ; 161: Xamarin.Kotlin.StdLib.Jdk8.dll => 312
	i64 u0x2801845a2c71fbfb, ; 162: System.Net.Primitives.dll => 71
	i64 u0x286835e259162700, ; 163: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 299
	i64 u0x28b311fffbc0f8df, ; 164: Microsoft.AspNetCore.WebUtilities => 213
	i64 u0x28e52865585a1ebe, ; 165: Microsoft.Extensions.Diagnostics.Abstractions.dll => 225
	i64 u0x2927d345f3daec35, ; 166: SkiaSharp.dll => 247
	i64 u0x2937d81e11ec0ddf, ; 167: Avalonia.Markup.Xaml.dll => 178
	i64 u0x29f947844fb7fc11, ; 168: Microsoft.Maui.Controls.HotReload.Forms => 318
	i64 u0x2a3b095612184159, ; 169: lib_System.Net.NetworkInformation.dll.so => 69
	i64 u0x2a6507a5ffabdf28, ; 170: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ad5d6b13b7a3e04, ; 171: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 172: System.Text.RegularExpressions.dll => 139
	i64 u0x2af615542f04da50, ; 173: System.IdentityModel.Tokens.Jwt.dll => 263
	i64 u0x2afc1c4f898552ee, ; 174: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b17908826439236, ; 175: Avalonia.Metal.dll => 180
	i64 u0x2b52706233239866, ; 176: Avalonia.Remote.Protocol.dll => 189
	i64 u0x2b6989d78cba9a15, ; 177: Xamarin.AndroidX.Concurrent.Futures.dll => 278
	i64 u0x2c40db0dbedda89b, ; 178: lib_Microsoft.AspNetCore.WebUtilities.dll.so => 213
	i64 u0x2c42baa2af5f9385, ; 179: lib_MimeMapping.dll.so => 241
	i64 u0x2cbd9262ca785540, ; 180: lib_System.Text.Encoding.CodePages.dll.so => 134
	i64 u0x2cc9e1fed6257257, ; 181: lib_System.Reflection.Emit.Lightweight.dll.so => 92
	i64 u0x2cd723e9fe623c7c, ; 182: lib_System.Private.Xml.Linq.dll.so => 88
	i64 u0x2d169d318a968379, ; 183: System.Threading.dll => 149
	i64 u0x2d5ffcae1ad0aaca, ; 184: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 185: System.Text.Json.dll => 138
	i64 u0x2dcaa0bb15a4117a, ; 186: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e5a40c319acb800, ; 187: System.IO.FileSystem => 51
	i64 u0x2f02f94df3200fe5, ; 188: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 189: System.Xml.ReaderWriter => 157
	i64 u0x2f5911d9ba814e4e, ; 190: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 191: lib_System.Xml.dll.so => 164
	i64 u0x2feb4d2fcda05cfd, ; 192: Microsoft.Extensions.Caching.Abstractions.dll => 219
	i64 u0x309ee9eeec09a71e, ; 193: lib_Xamarin.AndroidX.Fragment.dll.so => 287
	i64 u0x309f2bedefa9a318, ; 194: Microsoft.IdentityModel.Abstractions => 235
	i64 u0x30c6dda129408828, ; 195: System.IO.IsolatedStorage => 52
	i64 u0x31195fef5d8fb552, ; 196: _Microsoft.Android.Resource.Designer.dll => 323
	i64 u0x31496b779ed0663d, ; 197: lib_System.Reflection.DispatchProxy.dll.so => 90
	i64 u0x3235427f8d12dae1, ; 198: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x32aa989ff07a84ff, ; 199: lib_System.Xml.ReaderWriter.dll.so => 157
	i64 u0x32dbba5d256b19d3, ; 200: Supabase.Core => 253
	i64 u0x33829542f112d59b, ; 201: System.Collections.Immutable => 9
	i64 u0x341abc357fbb4ebf, ; 202: lib_System.Net.Sockets.dll.so => 76
	i64 u0x3496c1e2dcaf5ecc, ; 203: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x353590da528c9d22, ; 204: System.ComponentModel.Annotations => 13
	i64 u0x3552fc5d578f0fbf, ; 205: Xamarin.AndroidX.Arch.Core.Common => 274
	i64 u0x355c649948d55d97, ; 206: lib_System.Runtime.Intrinsics.dll.so => 109
	i64 u0x3598b7b6237a86b6, ; 207: lib_Microsoft.AspNetCore.Authentication.dll.so => 198
	i64 u0x360a66b9f4afb47e, ; 208: ShimSkiaSharp => 246
	i64 u0x3628ab68db23a01a, ; 209: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x3673b042508f5b6b, ; 210: lib_System.Runtime.Extensions.dll.so => 104
	i64 u0x36740f1a8ecdc6c4, ; 211: System.Numerics => 84
	i64 u0x36b2b50fdf589ae2, ; 212: System.Reflection.Emit.Lightweight => 92
	i64 u0x36cada77dc79928b, ; 213: System.IO.MemoryMappedFiles => 53
	i64 u0x374ef46b06791af6, ; 214: System.Reflection.Primitives.dll => 96
	i64 u0x375a0c086b00470b, ; 215: Microsoft.AspNetCore.Authentication.dll => 198
	i64 u0x376bf93e521a5417, ; 216: lib_Xamarin.Jetbrains.Annotations.dll.so => 309
	i64 u0x37bc29f3183003b6, ; 217: lib_System.IO.dll.so => 58
	i64 u0x37fd73cba07e0b9d, ; 218: lib_Microsoft.AspNetCore.Cryptography.Internal.dll.so => 202
	i64 u0x380134e03b1e160a, ; 219: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 220: System.Runtime.CompilerServices.Unsafe => 102
	i64 u0x385c17636bb6fe6e, ; 221: Xamarin.AndroidX.CustomView.dll => 283
	i64 u0x38869c811d74050e, ; 222: System.Net.NameResolution.dll => 68
	i64 u0x393c226616977fdb, ; 223: lib_Xamarin.AndroidX.ViewPager.dll.so => 307
	i64 u0x395b3053dde89e41, ; 224: lib_System.Reactive.dll.so => 264
	i64 u0x39a87563fdb248a0, ; 225: System.Reactive.dll => 264
	i64 u0x39aa39fda111d9d3, ; 226: Newtonsoft.Json => 242
	i64 u0x39c3107c28752af1, ; 227: lib_Microsoft.Extensions.FileProviders.Abstractions.dll.so => 226
	i64 u0x3a51880eea7585d2, ; 228: lib_Avalonia.Markup.Xaml.dll.so => 178
	i64 u0x3ab5859054645f72, ; 229: System.Security.Cryptography.Primitives.dll => 125
	i64 u0x3ad75090c3fac0e9, ; 230: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 300
	i64 u0x3ae44ac43a1fbdbb, ; 231: System.Runtime.Serialization => 116
	i64 u0x3b6f59802ed335c2, ; 232: Avalonia.MicroCom.dll => 181
	i64 u0x3b860f9932505633, ; 233: lib_System.Text.Encoding.Extensions.dll.so => 135
	i64 u0x3bea9ebe8c027c01, ; 234: lib_Microsoft.IdentityModel.Tokens.dll.so => 238
	i64 u0x3c3aafb6b3a00bf6, ; 235: lib_System.Security.Cryptography.X509Certificates.dll.so => 126
	i64 u0x3c4049146b59aa90, ; 236: System.Runtime.InteropServices.JavaScript => 106
	i64 u0x3c7c495f58ac5ee9, ; 237: Xamarin.Kotlin.StdLib => 310
	i64 u0x3c7e5ed3d5db71bb, ; 238: System.Security => 131
	i64 u0x3ca05b43ec08224f, ; 239: Microsoft.AspNetCore.Http.Extensions.dll => 210
	i64 u0x3d1c50cc001a991e, ; 240: Xamarin.Google.Guava.ListenableFuture.dll => 308
	i64 u0x3d2b1913edfc08d7, ; 241: lib_System.Threading.ThreadPool.dll.so => 147
	i64 u0x3d46f0b995082740, ; 242: System.Xml.Linq => 156
	i64 u0x3d9c2a242b040a50, ; 243: lib_Xamarin.AndroidX.Core.dll.so => 279
	i64 u0x3da7781d6333a8fe, ; 244: SQLitePCLRaw.batteries_v2 => 248
	i64 u0x3e1d4f6aea0771d8, ; 245: lib_Avalonia.Diagnostics.dll.so => 187
	i64 u0x3e5441657549b213, ; 246: Xamarin.AndroidX.ResourceInspection.Annotation => 300
	i64 u0x3e57d4d195c53c2e, ; 247: System.Reflection.TypeExtensions => 97
	i64 u0x3e580c35ecfc1247, ; 248: lib_Microsoft.AspNetCore.Http.dll.so => 208
	i64 u0x3e616ab4ed1f3f15, ; 249: lib_System.Data.dll.so => 24
	i64 u0x3eb671f65f076fb8, ; 250: Xamarin.AndroidX.Lifecycle.Common.Java8 => 290
	i64 u0x3f510adf788828dd, ; 251: System.Threading.Tasks.Extensions => 143
	i64 u0x3f6f5914291cdcf7, ; 252: Microsoft.Extensions.Hosting.Abstractions => 227
	i64 u0x4007fff231dcbc12, ; 253: lib_Supabase.Postgrest.dll.so => 256
	i64 u0x40c98b6bd77346d4, ; 254: Microsoft.VisualBasic.dll => 3
	i64 u0x41833cf766d27d96, ; 255: mscorlib => 167
	i64 u0x41cab042be111c34, ; 256: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 273
	i64 u0x423a9ecc4d905a88, ; 257: lib_System.Resources.ResourceManager.dll.so => 100
	i64 u0x423bf51ae7def810, ; 258: System.Xml.XPath => 161
	i64 u0x42462ff15ddba223, ; 259: System.Resources.Reader.dll => 99
	i64 u0x426597ce23d65da4, ; 260: lib_Xamarin.AndroidX.Lifecycle.Common.Java8.dll.so => 290
	i64 u0x4294a05ba79b4e3b, ; 261: Microsoft.AspNetCore.Authentication.Cookies.dll => 200
	i64 u0x42a31b86e6ccc3f0, ; 262: System.Diagnostics.Contracts => 25
	i64 u0x42d76b1d438bed3f, ; 263: Microsoft.AspNetCore.Identity => 212
	i64 u0x430e95b891249788, ; 264: lib_System.Reflection.Emit.dll.so => 93
	i64 u0x43375950ec7c1b6a, ; 265: netstandard.dll => 168
	i64 u0x434c4e1d9284cdae, ; 266: Mono.Android.dll => 172
	i64 u0x4362a90ce25cb6e1, ; 267: Avalonia.Diagnostics => 187
	i64 u0x437d06c381ed575a, ; 268: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43e8ca5bc927ff37, ; 269: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 286
	i64 u0x448bd33429269b19, ; 270: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 271: lib_System.Runtime.Serialization.Primitives.dll.so => 114
	i64 u0x4515080865a951a5, ; 272: Xamarin.Kotlin.StdLib.dll => 310
	i64 u0x45344658e8f1a46d, ; 273: Microsoft.AspNetCore.Authentication.Core => 201
	i64 u0x453c1277f85cf368, ; 274: lib_Microsoft.EntityFrameworkCore.Abstractions.dll.so => 216
	i64 u0x454b4d1e66bb783c, ; 275: Xamarin.AndroidX.Lifecycle.Process => 293
	i64 u0x458d2df79ac57c1d, ; 276: lib_System.IdentityModel.Tokens.Jwt.dll.so => 263
	i64 u0x45aceb3561dbf4e7, ; 277: Svg.Custom => 260
	i64 u0x45c40276a42e283e, ; 278: System.Diagnostics.TraceSource => 33
	i64 u0x45d124f3a617a7d2, ; 279: lib_Svg.Custom.dll.so => 260
	i64 u0x45d443f2a29adc37, ; 280: System.AppContext.dll => 6
	i64 u0x45fcc9fd66f25095, ; 281: Microsoft.Extensions.DependencyModel => 224
	i64 u0x463d680a1dec0810, ; 282: System.Security.Cryptography.Xml.dll => 266
	i64 u0x47358bd471172e1d, ; 283: lib_System.Xml.Linq.dll.so => 156
	i64 u0x480c0a47dd42dd81, ; 284: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x4972c623c86d2c28, ; 285: lib_Avalonia.DesignerSupport.dll.so => 176
	i64 u0x497eb1d03ac05c8a, ; 286: lib_Microsoft.Extensions.WebEncoders.dll.so => 234
	i64 u0x49e952f19a4e2022, ; 287: System.ObjectModel => 85
	i64 u0x49ea01c721d701b5, ; 288: lib_Microsoft.Net.Http.Headers.dll.so => 240
	i64 u0x49f9e6948a8131e4, ; 289: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 306
	i64 u0x4a7a18981dbd56bc, ; 290: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4ab01d3ffaf3dd27, ; 291: lib_Avalonia.Dialogs.dll.so => 177
	i64 u0x4b07a0ed0ab33ff4, ; 292: System.Runtime.Extensions.dll => 104
	i64 u0x4b576d47ac054f3c, ; 293: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 294: System.Text.Json => 138
	i64 u0x4c7755cf07ad2d5f, ; 295: System.Net.Http.Json.dll => 64
	i64 u0x4ca014ceac582c86, ; 296: Microsoft.EntityFrameworkCore.Relational.dll => 217
	i64 u0x4ca7077b553ba065, ; 297: Avalonia.Controls => 175
	i64 u0x4cc5f15266470798, ; 298: lib_Xamarin.AndroidX.Loader.dll.so => 298
	i64 u0x4cf6f67dc77aacd2, ; 299: System.Net.NetworkInformation.dll => 69
	i64 u0x4d3183dd245425d4, ; 300: System.Net.WebSockets.Client.dll => 80
	i64 u0x4d447523346ce7e7, ; 301: lib_Svg.Skia.dll.so => 262
	i64 u0x4d479f968a05e504, ; 302: System.Linq.Expressions.dll => 59
	i64 u0x4d55a010ffc4faff, ; 303: System.Private.Xml => 89
	i64 u0x4d5cbe77561c5b2e, ; 304: System.Web.dll => 154
	i64 u0x4d77512dbd86ee4c, ; 305: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 274
	i64 u0x4d7793536e79c309, ; 306: System.ServiceProcess => 133
	i64 u0x4d95fccc1f67c7ca, ; 307: System.Runtime.Loader.dll => 110
	i64 u0x4dd9247f1d2c3235, ; 308: Xamarin.AndroidX.Loader.dll => 298
	i64 u0x4e2aeee78e2c4a87, ; 309: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 299
	i64 u0x4e32f00cb0937401, ; 310: Mono.Android.Runtime => 171
	i64 u0x4e5eea4668ac2b18, ; 311: System.Text.Encoding.CodePages => 134
	i64 u0x4e8cf86fe3ecbfcd, ; 312: Supabase => 252
	i64 u0x4ebd0c4b82c5eefc, ; 313: lib_System.Threading.Channels.dll.so => 140
	i64 u0x4ee8eaa9c9c1151a, ; 314: System.Globalization.Calendars => 40
	i64 u0x4f0f420f6c43234c, ; 315: MimeMapping => 241
	i64 u0x4fd5f3ee53d0a4f0, ; 316: SQLitePCLRaw.lib.e_sqlite3.android => 250
	i64 u0x4ffd65baff757598, ; 317: Microsoft.IdentityModel.Tokens => 238
	i64 u0x503643e97176db84, ; 318: Sentry.Bindings.Android.dll => 245
	i64 u0x50c3a29b21050d45, ; 319: System.Linq.Parallel.dll => 60
	i64 u0x50ed43b4a9b11edd, ; 320: MicroCom.Runtime => 197
	i64 u0x5112ed116d87baf8, ; 321: CommunityToolkit.Mvvm => 193
	i64 u0x516324a5050a7e3c, ; 322: System.Net.WebProxy => 79
	i64 u0x516d6f0b21a303de, ; 323: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 324: System.Drawing => 36
	i64 u0x5216f09c5c4c95c8, ; 325: Microsoft.AspNetCore.Authentication.Abstractions => 199
	i64 u0x5247c5c32a4140f0, ; 326: System.Resources.Reader => 99
	i64 u0x526ce79eb8e90527, ; 327: lib_System.Net.Primitives.dll.so => 71
	i64 u0x527497f521875686, ; 328: Microsoft.AspNetCore.Http.Abstractions => 209
	i64 u0x52829f00b4467c38, ; 329: lib_System.Data.Common.dll.so => 22
	i64 u0x529ffe06f39ab8db, ; 330: Xamarin.AndroidX.Core => 279
	i64 u0x5324b9a9dedb24aa, ; 331: Microsoft.AspNetCore.Cryptography.Internal => 202
	i64 u0x53978aac584c666e, ; 332: lib_System.Security.Cryptography.Cng.dll.so => 121
	i64 u0x53a96d5c86c9e194, ; 333: System.Net.NetworkInformation => 69
	i64 u0x53be1038a61e8d44, ; 334: System.Runtime.InteropServices.RuntimeInformation.dll => 107
	i64 u0x5435e6f049e9bc37, ; 335: System.Security.Claims.dll => 119
	i64 u0x54470ccf96ae985a, ; 336: Avalonia.Themes.Simple.dll => 192
	i64 u0x54795225dd1587af, ; 337: lib_System.Runtime.dll.so => 117
	i64 u0x547a34f14e5f6210, ; 338: Xamarin.AndroidX.Lifecycle.Common.dll => 289
	i64 u0x54a0124adceadbc7, ; 339: Microsoft.AspNetCore.DataProtection => 204
	i64 u0x556e8b63b660ab8b, ; 340: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 291
	i64 u0x5588627c9a108ec9, ; 341: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 342: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 343: lib_System.Security.Cryptography.OpenSsl.dll.so => 124
	i64 u0x56442b99bc64bb47, ; 344: System.Runtime.Serialization.Xml.dll => 115
	i64 u0x56a8b26e1aeae27b, ; 345: System.Threading.Tasks.Dataflow => 142
	i64 u0x56f932d61e93c07f, ; 346: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 347: System.Private.Uri => 87
	i64 u0x576499c9f52fea31, ; 348: Xamarin.AndroidX.Annotation => 269
	i64 u0x578cd35c91d7b347, ; 349: lib_SQLitePCLRaw.core.dll.so => 249
	i64 u0x579a06fed6eec900, ; 350: System.Private.CoreLib.dll => 173
	i64 u0x57adda3c951abb33, ; 351: Microsoft.Extensions.Hosting.Abstractions.dll => 227
	i64 u0x57c542c14049b66d, ; 352: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 353: System.Threading.Timer => 148
	i64 u0x58688d9af496b168, ; 354: Microsoft.Extensions.DependencyInjection.dll => 222
	i64 u0x587f59a16b329d9c, ; 355: Microsoft.Net.Http.Headers => 240
	i64 u0x595a356d23e8da9a, ; 356: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59c270386bf40142, ; 357: Microsoft.AspNetCore.Hosting.Server.Abstractions => 207
	i64 u0x59f9e60b9475085f, ; 358: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 270
	i64 u0x5a27319ca17d5e68, ; 359: MicroCom.Runtime.dll => 197
	i64 u0x5a745f5101a75527, ; 360: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a8f6699f4a1caa9, ; 361: lib_System.Threading.dll.so => 149
	i64 u0x5a9765194c545c9a, ; 362: Zavrsni.Android => 0
	i64 u0x5ae9cd33b15841bf, ; 363: System.ComponentModel => 18
	i64 u0x5b1e476818ceaf8c, ; 364: lib_Avalonia.Themes.Simple.dll.so => 192
	i64 u0x5b54391bdc6fcfe6, ; 365: System.Private.DataContractSerialization => 86
	i64 u0x5b8109e8e14c5e3e, ; 366: System.Globalization.Extensions.dll => 41
	i64 u0x5bdf16b09da116ab, ; 367: Xamarin.AndroidX.Collection => 276
	i64 u0x5bf46208bead7b18, ; 368: ShimSkiaSharp.dll => 246
	i64 u0x5bff6a70194300bd, ; 369: lib_Xamarin.Kotlin.StdLib.Jdk8.dll.so => 312
	i64 u0x5c30a4a35f9cc8c4, ; 370: lib_System.Reflection.Extensions.dll.so => 94
	i64 u0x5c393624b8176517, ; 371: lib_Microsoft.Extensions.Logging.dll.so => 229
	i64 u0x5c53c29f5073b0c9, ; 372: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 373: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 374: System.Net.WebHeaderCollection.dll => 78
	i64 u0x5d40c9b15181641f, ; 375: lib_Xamarin.AndroidX.Emoji2.dll.so => 285
	i64 u0x5d6ca10d35e9485b, ; 376: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 278
	i64 u0x5d7ec76c1c703055, ; 377: System.Threading.Tasks.Parallel => 144
	i64 u0x5db0cbbd1028510e, ; 378: lib_System.Runtime.InteropServices.dll.so => 108
	i64 u0x5db30905d3e5013b, ; 379: Xamarin.AndroidX.Collection.Jvm.dll => 277
	i64 u0x5e361f1dfaff19f1, ; 380: Avalonia.Fonts.Inter.dll => 188
	i64 u0x5e467bc8f09ad026, ; 381: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 382: System.Runtime.Handles.dll => 105
	i64 u0x5ea92fdb19ec8c4c, ; 383: System.Text.Encodings.Web.dll => 137
	i64 u0x5eb8046dd40e9ac3, ; 384: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 385: System.Security.Cryptography.Csp.dll => 122
	i64 u0x5eee1376d94c7f5e, ; 386: System.Net.HttpListener.dll => 66
	i64 u0x5f36ccf5c6a57e24, ; 387: System.Xml.ReaderWriter.dll => 157
	i64 u0x5f3bce5c22261fd2, ; 388: ExCSS.dll => 194
	i64 u0x5f4294b9b63cb842, ; 389: System.Data.Common => 22
	i64 u0x5f7399e166075632, ; 390: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 250
	i64 u0x5fac98e0b37a5b9d, ; 391: System.Runtime.CompilerServices.Unsafe.dll => 102
	i64 u0x5fd02402d97cdaab, ; 392: lib_Microsoft.Extensions.ObjectPool.dll.so => 231
	i64 u0x609f4b7b63d802d4, ; 393: lib_Microsoft.Extensions.DependencyInjection.dll.so => 222
	i64 u0x60cd4e33d7e60134, ; 394: Xamarin.KotlinX.Coroutines.Core.Jvm => 317
	i64 u0x60f62d786afcf130, ; 395: System.Memory => 63
	i64 u0x61bb78c89f867353, ; 396: System.IO => 58
	i64 u0x61d88f399afb2f45, ; 397: lib_System.Runtime.Loader.dll.so => 110
	i64 u0x61f3f147709e029a, ; 398: Zavrsni.Android.dll => 0
	i64 u0x622eef6f9e59068d, ; 399: System.Private.CoreLib => 173
	i64 u0x6376ee64ab136329, ; 400: lib_Avalonia.Themes.Fluent.dll.so => 191
	i64 u0x63cdbd66ac39bb46, ; 401: lib_Microsoft.VisualStudio.DesignTools.XamlTapContract.dll.so => 321
	i64 u0x63d5e3aa4ef9b931, ; 402: Xamarin.KotlinX.Coroutines.Android.dll => 315
	i64 u0x63f1f6883c1e23c2, ; 403: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x640e3b14dbd325c2, ; 404: System.Security.Cryptography.Algorithms.dll => 120
	i64 u0x641c60df5c993ae3, ; 405: Avalonia.DesignerSupport => 176
	i64 u0x64587004560099b9, ; 406: System.Reflection => 98
	i64 u0x6475dcec04f1e59e, ; 407: Sentry.Bindings.Android => 245
	i64 u0x64b1529a438a3c45, ; 408: lib_System.Runtime.Handles.dll.so => 105
	i64 u0x65ece51227bfa724, ; 409: lib_System.Runtime.Numerics.dll.so => 111
	i64 u0x661722438787b57f, ; 410: Xamarin.AndroidX.Annotation.Jvm.dll => 271
	i64 u0x6679b2337ee6b22a, ; 411: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x6692e924eade1b29, ; 412: lib_System.Console.dll.so => 20
	i64 u0x66d13304ce1a3efa, ; 413: Xamarin.AndroidX.CursorAdapter => 282
	i64 u0x674303f65d8fad6f, ; 414: lib_System.Net.Quic.dll.so => 72
	i64 u0x67c0802770244408, ; 415: System.Windows.dll => 155
	i64 u0x68100b69286e27cd, ; 416: lib_System.Formats.Tar.dll.so => 39
	i64 u0x6872ec7a2e36b1ac, ; 417: System.Drawing.Primitives.dll => 35
	i64 u0x68bb2c417aa9b61c, ; 418: Xamarin.KotlinX.AtomicFU.dll => 313
	i64 u0x68fbbbe2eb455198, ; 419: System.Formats.Asn1 => 38
	i64 u0x699dffb2427a2d71, ; 420: SQLitePCLRaw.lib.e_sqlite3.android.dll => 250
	i64 u0x6a4d7577b2317255, ; 421: System.Runtime.InteropServices.dll => 108
	i64 u0x6afcedb171067e2b, ; 422: System.Core.dll => 21
	i64 u0x6b08bb626d38c6a4, ; 423: Avalonia.Controls.ColorPicker.dll => 186
	i64 u0x6bef98e124147c24, ; 424: Xamarin.Jetbrains.Annotations => 309
	i64 u0x6ca323bb74a4c28a, ; 425: Supabase.Storage.dll => 258
	i64 u0x6ce874bff138ce2b, ; 426: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 296
	i64 u0x6d70755158ca866e, ; 427: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 428: Microsoft.Extensions.Primitives => 233
	i64 u0x6d7eeca99577fc8b, ; 429: lib_System.Net.WebProxy.dll.so => 79
	i64 u0x6d8515b19946b6a2, ; 430: System.Net.WebProxy.dll => 79
	i64 u0x6d86d56b84c8eb71, ; 431: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 282
	i64 u0x6d9bea6b3e895cf7, ; 432: Microsoft.Extensions.Primitives.dll => 233
	i64 u0x6e838d9a2a6f6c9e, ; 433: lib_System.ValueTuple.dll.so => 152
	i64 u0x6e9965ce1095e60a, ; 434: lib_System.Core.dll.so => 21
	i64 u0x6f549bdbd19c7a4d, ; 435: Supabase.Gotrue => 255
	i64 u0x6ffc4967cc47ba57, ; 436: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 437: System.IO.FileSystem.dll => 51
	i64 u0x71485e7ffdb4b958, ; 438: System.Reflection.Extensions => 94
	i64 u0x717530326f808838, ; 439: lib_Microsoft.Extensions.Diagnostics.Abstractions.dll.so => 225
	i64 u0x71ad672adbe48f35, ; 440: System.ComponentModel.Primitives.dll => 16
	i64 u0x71bc142d620e986a, ; 441: lib_System.Security.Cryptography.Pkcs.dll.so => 265
	i64 u0x725f5a9e82a45c81, ; 442: System.Security.Cryptography.Encoding => 123
	i64 u0x72e0300099accce1, ; 443: System.Xml.XPath.XDocument => 160
	i64 u0x730bfb248998f67a, ; 444: System.IO.Compression.ZipFile => 45
	i64 u0x73a6be34e822f9d1, ; 445: lib_System.Runtime.Serialization.dll.so => 116
	i64 u0x73e4ce94e2eb6ffc, ; 446: lib_System.Memory.dll.so => 63
	i64 u0x73f2645914262879, ; 447: lib_Microsoft.EntityFrameworkCore.Sqlite.dll.so => 218
	i64 u0x743a1eccf080489a, ; 448: WindowsBase.dll => 166
	i64 u0x7503ac24fcf8095e, ; 449: Xamarin.AndroidX.Core.SplashScreen.dll => 281
	i64 u0x75c326eb821b85c4, ; 450: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 451: lib_Xamarin.AndroidX.SavedState.dll.so => 301
	i64 u0x76ca07b878f44da0, ; 452: System.Runtime.Numerics.dll => 111
	i64 u0x7736c8a96e51a061, ; 453: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 271
	i64 u0x778a805e625329ef, ; 454: System.Linq.Parallel => 60
	i64 u0x779290cc2b801eb7, ; 455: Xamarin.KotlinX.AtomicFU.Jvm => 314
	i64 u0x77f8a4acc2fdc449, ; 456: System.Security.Cryptography.Cng.dll => 121
	i64 u0x782c5d8eb99ff201, ; 457: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x78979a5b2d9eda26, ; 458: Avalonia.OpenGL => 182
	i64 u0x78a45e51311409b6, ; 459: Xamarin.AndroidX.Fragment.dll => 287
	i64 u0x78ed4ab8f9d800a1, ; 460: Xamarin.AndroidX.Lifecycle.ViewModel => 296
	i64 u0x7a39601d6f0bb831, ; 461: lib_Xamarin.KotlinX.AtomicFU.dll.so => 313
	i64 u0x7a7e7eddf79c5d26, ; 462: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 296
	i64 u0x7a9a57d43b0845fa, ; 463: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 464: Xamarin.AndroidX.Collection.dll => 276
	i64 u0x7b150145c0a9058c, ; 465: Microsoft.Data.Sqlite => 214
	i64 u0x7b4927e421291c41, ; 466: Microsoft.IdentityModel.JsonWebTokens.dll => 236
	i64 u0x7bef86a4335c4870, ; 467: System.ComponentModel.TypeConverter => 17
	i64 u0x7c41d387501568ba, ; 468: System.Net.WebClient.dll => 77
	i64 u0x7c915d27bc4afbdb, ; 469: Xamarin.AndroidX.Core.SplashScreen => 281
	i64 u0x7cd2ec8eaf5241cd, ; 470: System.Security.dll => 131
	i64 u0x7cf9ae50dd350622, ; 471: Xamarin.Jetbrains.Annotations.dll => 309
	i64 u0x7d14464ae904af64, ; 472: lib_Avalonia.Metal.dll.so => 180
	i64 u0x7d8ee2bdc8e3aad1, ; 473: System.Numerics.Vectors => 83
	i64 u0x7dfc3d6d9d8d7b70, ; 474: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 475: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 476: lib_System.Security.Claims.dll.so => 119
	i64 u0x7e4084a672f9c30e, ; 477: lib_System.Security.Cryptography.Xml.dll.so => 266
	i64 u0x7e571cad5915e6c3, ; 478: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 293
	i64 u0x7e6b1ca712437d7d, ; 479: Xamarin.AndroidX.Emoji2.ViewsHelper => 286
	i64 u0x7e946809d6008ef2, ; 480: lib_System.ObjectModel.dll.so => 85
	i64 u0x7ebe6126501e1198, ; 481: Microsoft.AspNetCore.Cryptography.KeyDerivation.dll => 203
	i64 u0x7ecc13347c8fd849, ; 482: lib_System.ComponentModel.dll.so => 18
	i64 u0x7eff369f2e01cf95, ; 483: Microsoft.AspNetCore.Http.Features => 211
	i64 u0x7f00ddd9b9ca5a13, ; 484: Xamarin.AndroidX.ViewPager.dll => 307
	i64 u0x7f9351cd44b1273f, ; 485: Microsoft.Extensions.Configuration.Abstractions => 221
	i64 u0x7fbd557c99b3ce6f, ; 486: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 292
	i64 u0x803f1de6fe44738a, ; 487: lib_Avalonia.dll.so => 184
	i64 u0x8076a9a44a2ca331, ; 488: System.Net.Quic => 72
	i64 u0x80b7e726b0280681, ; 489: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 319
	i64 u0x80da183a87731838, ; 490: System.Reflection.Metadata => 95
	i64 u0x80fa55b6d1b0be99, ; 491: SQLitePCLRaw.provider.e_sqlite3 => 251
	i64 u0x812c069d5cdecc17, ; 492: System.dll => 165
	i64 u0x81381be520a60adb, ; 493: Xamarin.AndroidX.Interpolator.dll => 288
	i64 u0x81657cec2b31e8aa, ; 494: System.Net => 82
	i64 u0x822aa49008112ebe, ; 495: Microsoft.Extensions.ObjectPool => 231
	i64 u0x8277f2be6b5ce05f, ; 496: Xamarin.AndroidX.AppCompat => 272
	i64 u0x82920a8d9194a019, ; 497: Xamarin.KotlinX.AtomicFU.Jvm.dll => 314
	i64 u0x82b399cb01b531c4, ; 498: lib_System.Web.dll.so => 154
	i64 u0x82df8f5532a10c59, ; 499: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 500: lib_System.Transactions.dll.so => 151
	i64 u0x8308a506644563bb, ; 501: Avalonia.Metal => 180
	i64 u0x83a2d9ad3c54f4f8, ; 502: MimeMapping.dll => 241
	i64 u0x83a7afd2c49adc86, ; 503: lib_Microsoft.IdentityModel.Abstractions.dll.so => 235
	i64 u0x846ce984efea52c7, ; 504: System.Threading.Tasks.Parallel.dll => 144
	i64 u0x84ae73148a4557d2, ; 505: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 506: System.Runtime.Serialization.Json.dll => 113
	i64 u0x84cd5cdec0f54bcc, ; 507: lib_Microsoft.EntityFrameworkCore.Relational.dll.so => 217
	i64 u0x84f20950c4c7164b, ; 508: Microsoft.AspNetCore.Http => 208
	i64 u0x84f9060cc4a93c8f, ; 509: lib_SkiaSharp.dll.so => 247
	i64 u0x850c5ba0b57ce8e7, ; 510: lib_Xamarin.AndroidX.Collection.dll.so => 276
	i64 u0x851d02edd334b044, ; 511: Xamarin.AndroidX.VectorDrawable => 304
	i64 u0x8662aaeb94fef37f, ; 512: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x8690556019b686eb, ; 513: Svg.Custom.dll => 260
	i64 u0x86b5381885cbbb52, ; 514: lib_Svg.Model.dll.so => 261
	i64 u0x86b62cb077ec4fd7, ; 515: System.Runtime.Serialization.Xml => 115
	i64 u0x8706ffb12bf3f53d, ; 516: Xamarin.AndroidX.Annotation.Experimental => 270
	i64 u0x872a5b14c18d328c, ; 517: System.ComponentModel.DataAnnotations => 14
	i64 u0x87c4b8a492b176ad, ; 518: Microsoft.EntityFrameworkCore.Abstractions => 216
	i64 u0x87c69b87d9283884, ; 519: lib_System.Threading.Thread.dll.so => 146
	i64 u0x87d6cb5c641c5f07, ; 520: Microsoft.AspNetCore.Http.Abstractions.dll => 209
	i64 u0x87f6569b25707834, ; 521: System.IO.Compression.Brotli.dll => 43
	i64 u0x8808a9d7c53dc4c0, ; 522: lib_HarfBuzzSharp.dll.so => 195
	i64 u0x88ba6bc4f7762b03, ; 523: lib_System.Reflection.dll.so => 98
	i64 u0x88bda98e0cffb7a9, ; 524: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 317
	i64 u0x8930322c7bd8f768, ; 525: netstandard => 168
	i64 u0x897a606c9e39c75f, ; 526: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x898a9b4e63f2c138, ; 527: lib_Microsoft.AspNetCore.Identity.dll.so => 212
	i64 u0x89911a22005b92b7, ; 528: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 529: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 107
	i64 u0x8a0b6f586fccda8a, ; 530: lib_Microsoft.AspNetCore.Http.Extensions.dll.so => 210
	i64 u0x8a14bf4400a024af, ; 531: lib_Microsoft.AspNetCore.Http.Features.dll.so => 211
	i64 u0x8a19e3dc71b34b2c, ; 532: System.Reflection.TypeExtensions.dll => 97
	i64 u0x8a21b916d9796fa5, ; 533: Avalonia.MicroCom => 181
	i64 u0x8a399a706fcbce4b, ; 534: Microsoft.Extensions.Caching.Abstractions => 219
	i64 u0x8ad229ea26432ee2, ; 535: Xamarin.AndroidX.Loader => 298
	i64 u0x8b4ff5d0fdd5faa1, ; 536: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 537: System.Security.Principal.Windows => 128
	i64 u0x8b8d01333a96d0b5, ; 538: System.Diagnostics.Process.dll => 29
	i64 u0x8bb8206f414c7c3b, ; 539: Microsoft.AspNetCore.Authentication.Core.dll => 201
	i64 u0x8c575135aa1ccef4, ; 540: Microsoft.Extensions.FileProviders.Abstractions => 226
	i64 u0x8cdfdb4ce85fb925, ; 541: lib_System.Security.Principal.Windows.dll.so => 128
	i64 u0x8cdfe7b8f4caa426, ; 542: System.IO.Compression.FileSystem => 44
	i64 u0x8d0f420977c2c1c7, ; 543: Xamarin.AndroidX.CursorAdapter.dll => 282
	i64 u0x8d52a25632e81824, ; 544: Microsoft.EntityFrameworkCore.Sqlite.dll => 218
	i64 u0x8d52f7ea2796c531, ; 545: Xamarin.AndroidX.Emoji2.dll => 285
	i64 u0x8d7b8ab4b3310ead, ; 546: System.Threading => 149
	i64 u0x8da188285aadfe8e, ; 547: System.Collections.Concurrent => 8
	i64 u0x8dce248c34c54ef3, ; 548: lib_Microsoft.AspNetCore.Hosting.Abstractions.dll.so => 206
	i64 u0x8ec6e06a61c1baeb, ; 549: lib_Newtonsoft.Json.dll.so => 242
	i64 u0x8ef9414937d93a0a, ; 550: SQLitePCLRaw.core.dll => 249
	i64 u0x8f44b45eb046bbd1, ; 551: System.ServiceModel.Web.dll => 132
	i64 u0x8f6c449086c8c157, ; 552: Svg.Controls.Skia.Avalonia.dll => 259
	i64 u0x8fb4480c06374c78, ; 553: lib_Avalonia.Android.dll.so => 185
	i64 u0x8fbf5b0114c6dcef, ; 554: System.Globalization.dll => 42
	i64 u0x8fd27d934d7b3a55, ; 555: SQLitePCLRaw.core => 249
	i64 u0x90263f8448b8f572, ; 556: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 557: _Microsoft.Android.Resource.Designer => 323
	i64 u0x90393bd4865292f3, ; 558: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 559: System.Threading.Tasks.Extensions.dll => 143
	i64 u0x91418dc638b29e68, ; 560: lib_Xamarin.AndroidX.CustomView.dll.so => 283
	i64 u0x9157bd523cd7ed36, ; 561: lib_System.Text.Json.dll.so => 138
	i64 u0x91a74f07b30d37e2, ; 562: System.Linq.dll => 62
	i64 u0x91cb86ea3b17111d, ; 563: System.ServiceModel.Web => 132
	i64 u0x92054e486c0c7ea7, ; 564: System.IO.FileSystem.DriveInfo => 48
	i64 u0x9216ea747d0be31f, ; 565: lib_Avalonia.Controls.dll.so => 175
	i64 u0x9246426168cfbd4a, ; 566: Avalonia.Dialogs.dll => 177
	i64 u0x928614058c40c4cd, ; 567: lib_System.Xml.XPath.XDocument.dll.so => 160
	i64 u0x92b138fffca2b01e, ; 568: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 275
	i64 u0x9388aad9b7ae40ce, ; 569: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 289
	i64 u0x944077d8ca3c6580, ; 570: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 571: System.Xml => 164
	i64 u0x948d746a7702861f, ; 572: Microsoft.IdentityModel.Logging.dll => 237
	i64 u0x94c8990839c4bdb1, ; 573: lib_Xamarin.AndroidX.Interpolator.dll.so => 288
	i64 u0x9564283c37ed59a9, ; 574: lib_Microsoft.IdentityModel.Logging.dll.so => 237
	i64 u0x96a7347adc67c496, ; 575: lib_Avalonia.Skia.dll.so => 190
	i64 u0x96cfafe6410410d8, ; 576: lib_Avalonia.Vulkan.dll.so => 183
	i64 u0x9799aee8e42cced3, ; 577: Avalonia.Skia.dll => 190
	i64 u0x97b8c771ea3e4220, ; 578: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 579: System.Collections.Concurrent.dll => 8
	i64 u0x9843944103683dd3, ; 580: Xamarin.AndroidX.Core.Core.Ktx => 280
	i64 u0x98d720cc4597562c, ; 581: System.Security.Cryptography.OpenSsl => 124
	i64 u0x991d510397f92d9d, ; 582: System.Linq.Expressions => 59
	i64 u0x996ceeb8a3da3d67, ; 583: System.Threading.Overlapped.dll => 141
	i64 u0x999cb19e1a04ffd3, ; 584: CommunityToolkit.Mvvm.dll => 193
	i64 u0x9a01b1da98b6ee10, ; 585: Xamarin.AndroidX.Lifecycle.Runtime.dll => 294
	i64 u0x9a816d9654deff7c, ; 586: Microsoft.IO.RecyclableMemoryStream => 239
	i64 u0x9b211a749105beac, ; 587: System.Transactions.Local => 150
	i64 u0x9b68e31c09020a8f, ; 588: Avalonia.Markup.dll => 179
	i64 u0x9b752ff98fbe7da9, ; 589: Svg.Controls.Skia.Avalonia => 259
	i64 u0x9b8734714671022d, ; 590: System.Threading.Tasks.Dataflow.dll => 142
	i64 u0x9bc6aea27fbf034f, ; 591: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 316
	i64 u0x9bd8cc74558ad4c7, ; 592: Xamarin.KotlinX.AtomicFU => 313
	i64 u0x9c244ac7cda32d26, ; 593: System.Security.Cryptography.X509Certificates.dll => 126
	i64 u0x9c36a0f95393e81c, ; 594: Supabase.Postgrest.dll => 256
	i64 u0x9c465f280cf43733, ; 595: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 315
	i64 u0x9c8f6872beab6408, ; 596: System.Xml.XPath.XDocument.dll => 160
	i64 u0x9ce01cf91101ae23, ; 597: System.Xml.XmlDocument => 162
	i64 u0x9d5dbcf5a48583fe, ; 598: lib_Xamarin.AndroidX.Activity.dll.so => 268
	i64 u0x9d74dee1a7725f34, ; 599: Microsoft.Extensions.Configuration.Abstractions.dll => 221
	i64 u0x9e4b95dec42769f7, ; 600: System.Diagnostics.Debug.dll => 26
	i64 u0x9ef542cf1f78c506, ; 601: Xamarin.AndroidX.Lifecycle.LiveData.Core => 292
	i64 u0x9f9c5c252feedc26, ; 602: Avalonia.OpenGL.dll => 182
	i64 u0xa00832eb975f56a8, ; 603: lib_System.Net.dll.so => 82
	i64 u0xa08c521f3ed09e51, ; 604: Zavrsni => 322
	i64 u0xa0d8259f4cc284ec, ; 605: lib_System.Security.Cryptography.dll.so => 127
	i64 u0xa0ff9b3e34d92f11, ; 606: lib_System.Resources.Writer.dll.so => 101
	i64 u0xa12fbfb4da97d9f3, ; 607: System.Threading.Timer.dll => 148
	i64 u0xa135be3d6497d3d3, ; 608: Supabase.Core.dll => 253
	i64 u0xa2572680829d2c7c, ; 609: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 610: System.Xml.XmlDocument.dll => 162
	i64 u0xa28642c7ac33c167, ; 611: Avalonia.Markup => 179
	i64 u0xa308401900e5bed3, ; 612: lib_mscorlib.dll.so => 167
	i64 u0xa395572e7da6c99d, ; 613: lib_System.Security.dll.so => 131
	i64 u0xa3c64c49e90a9987, ; 614: System.Security.Cryptography.Pkcs => 265
	i64 u0xa3e683f24b43af6f, ; 615: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 616: Xamarin.AndroidX.VectorDrawable.Animated => 305
	i64 u0xa4d20d2ff0563d26, ; 617: lib_CommunityToolkit.Mvvm.dll.so => 193
	i64 u0xa4edc8f2ceae241a, ; 618: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 619: System.Runtime.Serialization.Formatters.dll => 112
	i64 u0xa54b74df83dce92b, ; 620: System.Reflection.DispatchProxy => 90
	i64 u0xa5b7152421ed6d98, ; 621: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 622: lib_System.Linq.Parallel.dll.so => 60
	i64 u0xa5ce5c755bde8cb8, ; 623: lib_System.Security.Cryptography.Csp.dll.so => 122
	i64 u0xa5e599d1e0524750, ; 624: System.Numerics.Vectors.dll => 83
	i64 u0xa5f1ba49b85dd355, ; 625: System.Security.Cryptography.dll => 127
	i64 u0xa61975a5a37873ea, ; 626: lib_System.Xml.XmlSerializer.dll.so => 163
	i64 u0xa6645e3d03867094, ; 627: Svg.Skia => 262
	i64 u0xa66cbee0130865f7, ; 628: lib_WindowsBase.dll.so => 166
	i64 u0xa67dbee13e1df9ca, ; 629: Xamarin.AndroidX.SavedState.dll => 301
	i64 u0xa68a420042bb9b1f, ; 630: Xamarin.AndroidX.DrawerLayout.dll => 284
	i64 u0xa75386b5cb9595aa, ; 631: Xamarin.AndroidX.Lifecycle.Runtime.Android => 295
	i64 u0xa75cf331ee476318, ; 632: lib_Microsoft.AspNetCore.Http.Abstractions.dll.so => 209
	i64 u0xa763fbb98df8d9fb, ; 633: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 634: Xamarin.AndroidX.Lifecycle.Common.Jvm => 291
	i64 u0xa7eab29ed44b4e7a, ; 635: Mono.Android.Export => 170
	i64 u0xa8195217cbf017b7, ; 636: Microsoft.VisualBasic.Core => 2
	i64 u0xa8b52f21e0dbe690, ; 637: System.Runtime.Serialization.dll => 116
	i64 u0xa8c84ce526c2b4bd, ; 638: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 321
	i64 u0xa8e6320dd07580ef, ; 639: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 236
	i64 u0xa8ee4ed7de2efaee, ; 640: Xamarin.AndroidX.Annotation.dll => 269
	i64 u0xa95590e7c57438a4, ; 641: System.Configuration => 19
	i64 u0xaa2219c8e3449ff5, ; 642: Microsoft.Extensions.Logging.Abstractions => 230
	i64 u0xaa443ac34067eeef, ; 643: System.Private.Xml.dll => 89
	i64 u0xaa52de307ef5d1dd, ; 644: System.Net.Http => 65
	i64 u0xaa9a7b0214a5cc5c, ; 645: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 646: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 223
	i64 u0xab9c1b2687d86b0b, ; 647: lib_System.Linq.Expressions.dll.so => 59
	i64 u0xac2af3fa195a15ce, ; 648: System.Runtime.Numerics => 111
	i64 u0xac5376a2a538dc10, ; 649: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 292
	i64 u0xac5acae88f60357e, ; 650: System.Diagnostics.Tools.dll => 32
	i64 u0xac79c7e46047ad98, ; 651: System.Security.Principal.Windows.dll => 128
	i64 u0xac98d31068e24591, ; 652: System.Xml.XDocument => 159
	i64 u0xacd4f3866b293bb7, ; 653: Microsoft.AspNetCore.Authentication.Cookies => 200
	i64 u0xacdd9e4180d56dda, ; 654: Xamarin.AndroidX.Concurrent.Futures => 278
	i64 u0xacf42eea7ef9cd12, ; 655: System.Threading.Channels => 140
	i64 u0xadbb53caf78a79d2, ; 656: System.Web.HttpUtility => 153
	i64 u0xadc90ab061a9e6e4, ; 657: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadf4cf30debbeb9a, ; 658: System.Net.ServicePoint.dll => 75
	i64 u0xadf511667bef3595, ; 659: System.Net.Security => 74
	i64 u0xae0aaa94fdcfce0f, ; 660: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 661: Java.Interop => 169
	i64 u0xae53579c90db1107, ; 662: System.ObjectModel.dll => 85
	i64 u0xaec7c0c7e2ed4575, ; 663: lib_Xamarin.KotlinX.AtomicFU.Jvm.dll.so => 314
	i64 u0xaf12fb8133ac3fbb, ; 664: Microsoft.EntityFrameworkCore.Sqlite => 218
	i64 u0xaf732d0b2193b8f5, ; 665: System.Security.Cryptography.OpenSsl.dll => 124
	i64 u0xafe29f45095518e7, ; 666: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 297
	i64 u0xb05b6f0a6cc8ddbb, ; 667: lib_Microsoft.IO.RecyclableMemoryStream.dll.so => 239
	i64 u0xb0bb43dc52ea59f9, ; 668: System.Diagnostics.Tracing.dll => 34
	i64 u0xb110d64b6c9fbe46, ; 669: lib_Microsoft.Extensions.Identity.Core.dll.so => 228
	i64 u0xb1dd05401aa8ee63, ; 670: System.Security.AccessControl => 118
	i64 u0xb220631954820169, ; 671: System.Text.RegularExpressions => 139
	i64 u0xb2376e1dbf8b4ed7, ; 672: System.Security.Cryptography.Csp => 122
	i64 u0xb24e06ce97f7b2bf, ; 673: Svg.Model.dll => 261
	i64 u0xb2a1959fe95c5402, ; 674: lib_System.Runtime.InteropServices.JavaScript.dll.so => 106
	i64 u0xb3011a0a57f7ffb2, ; 675: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 319
	i64 u0xb3874072ee0ecf8c, ; 676: Xamarin.AndroidX.VectorDrawable.Animated.dll => 305
	i64 u0xb4bd7015ecee9d86, ; 677: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 678: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 679: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb52aa297a3a175b1, ; 680: lib_Microsoft.AspNetCore.Authentication.Core.dll.so => 201
	i64 u0xb545f78b0415b9b9, ; 681: Microsoft.AspNetCore.WebUtilities.dll => 213
	i64 u0xb5c38bf497a4cfe2, ; 682: lib_System.Threading.Tasks.dll.so => 145
	i64 u0xb5c7fcdafbc67ee4, ; 683: Microsoft.Extensions.Logging.Abstractions.dll => 230
	i64 u0xb5dc0290c441c648, ; 684: lib_Microsoft.AspNetCore.Authentication.Cookies.dll.so => 200
	i64 u0xb5e2ea1bb00704d6, ; 685: Xamarin.Kotlin.StdLib.Jdk7.dll => 311
	i64 u0xb5ea31d5244c6626, ; 686: System.Threading.ThreadPool.dll => 147
	i64 u0xb7212c4683a94afe, ; 687: System.Drawing.Primitives => 35
	i64 u0xb76fec8889890d92, ; 688: lib_Xamarin.AndroidX.Core.SplashScreen.dll.so => 281
	i64 u0xb81a2c6e0aee50fe, ; 689: lib_System.Private.CoreLib.dll.so => 173
	i64 u0xb8c60af47c08d4da, ; 690: System.Net.ServicePoint => 75
	i64 u0xb8e68d20aad91196, ; 691: lib_System.Xml.XPath.dll.so => 161
	i64 u0xb9185c33a1643eed, ; 692: Microsoft.CSharp.dll => 1
	i64 u0xb95c522c772254d2, ; 693: Microsoft.AspNetCore.DataProtection.dll => 204
	i64 u0xba4670aa94a2b3c6, ; 694: lib_System.Xml.XDocument.dll.so => 159
	i64 u0xba48785529705af9, ; 695: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 696: lib_System.Windows.dll.so => 155
	i64 u0xbadbc0a44214b54e, ; 697: K4os.Compression.LZ4 => 196
	i64 u0xbb286883bc35db36, ; 698: System.Transactions.dll => 151
	i64 u0xbb54fd4c9d1101e1, ; 699: lib_Supabase.dll.so => 252
	i64 u0xbb639e0337b3d979, ; 700: Microsoft.AspNetCore.Http.dll => 208
	i64 u0xbb65706fde942ce3, ; 701: System.Net.Sockets => 76
	i64 u0xbba28979413cad9e, ; 702: lib_System.Runtime.CompilerServices.VisualC.dll.so => 103
	i64 u0xbbd180354b67271a, ; 703: System.Runtime.Serialization.Formatters => 112
	i64 u0xbc22a245dab70cb4, ; 704: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 251
	i64 u0xbc260cdba33291a3, ; 705: Xamarin.AndroidX.Arch.Core.Common.dll => 274
	i64 u0xbcc7a047ca7ce896, ; 706: Avalonia.Diagnostics.dll => 187
	i64 u0xbd0e2c0d55246576, ; 707: System.Net.Http.dll => 65
	i64 u0xbd3fbd85b9e1cb29, ; 708: lib_System.Net.HttpListener.dll.so => 66
	i64 u0xbd4f572d2bd0a789, ; 709: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd877b14d0b56392, ; 710: System.Runtime.Intrinsics.dll => 109
	i64 u0xbde4cd9bb9008cb3, ; 711: lib_Microsoft.AspNetCore.Authentication.Abstractions.dll.so => 199
	i64 u0xbe65a49036345cf4, ; 712: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 713: Xamarin.AndroidX.AppCompat.AppCompatResources => 273
	i64 u0xbef9919db45b4ca7, ; 714: System.IO.Pipes.AccessControl => 55
	i64 u0xbf02c92392c99ce0, ; 715: Websocket.Client => 267
	i64 u0xbf0fa68611139208, ; 716: lib_Xamarin.AndroidX.Annotation.dll.so => 269
	i64 u0xbf677a56a0f14616, ; 717: Microsoft.AspNetCore.Authentication => 198
	i64 u0xbfc1e1fb3095f2b3, ; 718: lib_System.Net.Http.Json.dll.so => 64
	i64 u0xc07cadab29efeba0, ; 719: Xamarin.AndroidX.Core.Core.Ktx.dll => 280
	i64 u0xc0a084644b51e835, ; 720: Sentry => 243
	i64 u0xc0d928351ab5ca77, ; 721: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 722: System.Runtime.Intrinsics => 109
	i64 u0xc111030af54d7191, ; 723: System.Resources.Writer => 101
	i64 u0xc12b8b3afa48329c, ; 724: lib_System.Linq.dll.so => 62
	i64 u0xc183ca0b74453aa9, ; 725: lib_System.Threading.Tasks.Dataflow.dll.so => 142
	i64 u0xc1c2cb7af77b8858, ; 726: Microsoft.EntityFrameworkCore => 215
	i64 u0xc1ff9ae3cdb6e1e6, ; 727: Xamarin.AndroidX.Activity.dll => 268
	i64 u0xc26c064effb1dea9, ; 728: System.Buffers.dll => 7
	i64 u0xc278de356ad8a9e3, ; 729: Microsoft.IdentityModel.Logging => 237
	i64 u0xc27e35acb993bc55, ; 730: Microsoft.AspNetCore.Identity.dll => 212
	i64 u0xc2902f6cf5452577, ; 731: lib_Mono.Android.Export.dll.so => 170
	i64 u0xc2a3bca55b573141, ; 732: System.IO.FileSystem.Watcher => 50
	i64 u0xc30b52815b58ac2c, ; 733: lib_System.Runtime.Serialization.Xml.dll.so => 115
	i64 u0xc3492f8f90f96ce4, ; 734: lib_Microsoft.Extensions.DependencyModel.dll.so => 224
	i64 u0xc36d7d89c652f455, ; 735: System.Threading.Overlapped => 141
	i64 u0xc3c86c1e5e12f03d, ; 736: WindowsBase => 166
	i64 u0xc421b61fd853169d, ; 737: lib_System.Net.WebSockets.Client.dll.so => 80
	i64 u0xc463e077917aa21d, ; 738: System.Runtime.Serialization.Json => 113
	i64 u0xc472ce300460ccb6, ; 739: Microsoft.EntityFrameworkCore.dll => 215
	i64 u0xc4d3858ed4d08512, ; 740: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 297
	i64 u0xc4d69851fe06342f, ; 741: lib_Microsoft.Extensions.Caching.Memory.dll.so => 220
	i64 u0xc4f72c53a5b1ad3e, ; 742: Avalonia.Android.dll => 185
	i64 u0xc50fded0ded1418c, ; 743: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 744: lib_System.Net.Requests.dll.so => 73
	i64 u0xc5325b2fcb37446f, ; 745: lib_System.Private.Xml.dll.so => 89
	i64 u0xc5a0f4b95a699af7, ; 746: lib_System.Private.Uri.dll.so => 87
	i64 u0xc5cdcd5b6277579e, ; 747: lib_System.Security.Cryptography.Algorithms.dll.so => 120
	i64 u0xc5ec286825cb0bf4, ; 748: Xamarin.AndroidX.Tracing.Tracing => 303
	i64 u0xc6068c73a3554082, ; 749: Avalonia.Fonts.Inter => 188
	i64 u0xc6706bc8aa7fe265, ; 750: Xamarin.AndroidX.Annotation.Jvm => 271
	i64 u0xc674822f2d239e99, ; 751: lib_Avalonia.Markup.dll.so => 179
	i64 u0xc7c01e7d7c93a110, ; 752: System.Text.Encoding.Extensions.dll => 135
	i64 u0xc7ce851898a4548e, ; 753: lib_System.Web.HttpUtility.dll.so => 153
	i64 u0xc809d4089d2556b2, ; 754: System.Runtime.InteropServices.JavaScript.dll => 106
	i64 u0xc858a28d9ee5a6c5, ; 755: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 756: System.Reflection.DispatchProxy.dll => 90
	i64 u0xc9c62c8f354ac568, ; 757: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xca32340d8d54dcd5, ; 758: Microsoft.Extensions.Caching.Memory.dll => 220
	i64 u0xca5801070d9fccfb, ; 759: System.Text.Encoding => 136
	i64 u0xcab42f35c3013077, ; 760: Sentry.dll => 243
	i64 u0xcadbc92899a777f0, ; 761: Xamarin.AndroidX.Startup.StartupRuntime => 302
	i64 u0xcb281152a61ad34a, ; 762: lib_Zavrsni.dll.so => 322
	i64 u0xcb45618372c47127, ; 763: Microsoft.EntityFrameworkCore.Relational => 217
	i64 u0xcb76efab0f56f81a, ; 764: System.Reactive => 264
	i64 u0xcbb5f80c7293e696, ; 765: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 766: lib__Microsoft.Android.Resource.Designer.dll.so => 323
	i64 u0xcc2876b32ef2794c, ; 767: lib_System.Text.RegularExpressions.dll.so => 139
	i64 u0xcc5c3bb714c4561e, ; 768: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 317
	i64 u0xcc9fa2923aa1c9ef, ; 769: System.Diagnostics.Contracts.dll => 25
	i64 u0xcd10a42808629144, ; 770: System.Net.Requests => 73
	i64 u0xcd7fa3f96e8ceaaa, ; 771: Xamarin.AndroidX.Lifecycle.Common.Java8.dll => 290
	i64 u0xcdca1b920e9f53ba, ; 772: Xamarin.AndroidX.Interpolator => 288
	i64 u0xcde1fa22dc303670, ; 773: Microsoft.VisualStudio.DesignTools.XamlTapContract => 321
	i64 u0xceef1924dde133c4, ; 774: Zavrsni.dll => 322
	i64 u0xcf23d8093f3ceadf, ; 775: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 776: System.Net.Mail.dll => 67
	i64 u0xcf8fc898f98b0d34, ; 777: System.Private.Xml.Linq => 88
	i64 u0xd04b5f59ed596e31, ; 778: System.Reflection.Metadata.dll => 95
	i64 u0xd063299fcfc0c93f, ; 779: lib_System.Runtime.Serialization.Json.dll.so => 113
	i64 u0xd0de8a113e976700, ; 780: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 781: System.Runtime.Extensions => 104
	i64 u0xd1194e1d8a8de83c, ; 782: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 291
	i64 u0xd1268c6d5c152eea, ; 783: lib_Avalonia.OpenGL.dll.so => 182
	i64 u0xd12beacdfc14f696, ; 784: System.Dynamic.Runtime => 37
	i64 u0xd16fd7fb9bbcd43e, ; 785: Microsoft.Extensions.Diagnostics.Abstractions => 225
	i64 u0xd198e7ce1b6a8344, ; 786: System.Net.Quic.dll => 72
	i64 u0xd3144156a3727ebe, ; 787: Xamarin.Google.Guava.ListenableFuture => 308
	i64 u0xd333d0af9e423810, ; 788: System.Runtime.InteropServices => 108
	i64 u0xd33a415cb4278969, ; 789: System.Security.Cryptography.Encoding.dll => 123
	i64 u0xd3426d966bb704f5, ; 790: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 273
	i64 u0xd3651b6fc3125825, ; 791: System.Private.Uri.dll => 87
	i64 u0xd373685349b1fe8b, ; 792: Microsoft.Extensions.Logging.dll => 229
	i64 u0xd3801faafafb7698, ; 793: System.Private.DataContractSerialization.dll => 86
	i64 u0xd3edcc1f25459a50, ; 794: System.Reflection.Emit => 93
	i64 u0xd42655883bb8c19f, ; 795: Microsoft.EntityFrameworkCore.Abstractions.dll => 216
	i64 u0xd45462df8fe5e800, ; 796: lib_MicroCom.Runtime.dll.so => 197
	i64 u0xd4645626dffec99d, ; 797: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 223
	i64 u0xd4fa0abb79079ea9, ; 798: System.Security.Principal.dll => 129
	i64 u0xd5507e11a2b2839f, ; 799: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 297
	i64 u0xd5d04bef8478ea19, ; 800: Xamarin.AndroidX.Tracing.Tracing.dll => 303
	i64 u0xd65786d27a4ad960, ; 801: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 318
	i64 u0xd6694f8359737e4e, ; 802: Xamarin.AndroidX.SavedState => 301
	i64 u0xd6949e129339eae5, ; 803: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 280
	i64 u0xd72329819cbbbc44, ; 804: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 221
	i64 u0xd72c760af136e863, ; 805: System.Xml.XmlSerializer.dll => 163
	i64 u0xd753f071e44c2a03, ; 806: lib_System.Security.SecureString.dll.so => 130
	i64 u0xd7b3764ada9d341d, ; 807: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 230
	i64 u0xd7f0088bc5ad71f2, ; 808: Xamarin.AndroidX.VersionedParcelable => 306
	i64 u0xd88b5f5bbc332508, ; 809: Avalonia.Base => 174
	i64 u0xd8fb25e28ae30a12, ; 810: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 299
	i64 u0xda1dfa4c534a9251, ; 811: Microsoft.Extensions.DependencyInjection => 222
	i64 u0xdad05a11827959a3, ; 812: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 813: System.IO.FileSystem.Primitives => 49
	i64 u0xdb1b4b8779f49288, ; 814: lib_Avalonia.MicroCom.dll.so => 181
	i64 u0xdb58816721c02a59, ; 815: lib_System.Reflection.Emit.ILGeneration.dll.so => 91
	i64 u0xdbf2a779fbc3ac31, ; 816: System.Transactions.Local.dll => 150
	i64 u0xdbf9607a441b4505, ; 817: System.Linq => 62
	i64 u0xdbfc90157a0de9b0, ; 818: lib_System.Text.Encoding.dll.so => 136
	i64 u0xdc75032002d1a212, ; 819: lib_System.Transactions.Local.dll.so => 150
	i64 u0xdca8be7403f92d4f, ; 820: lib_System.Linq.Queryable.dll.so => 61
	i64 u0xdce2c53525640bf3, ; 821: Microsoft.Extensions.Logging => 229
	i64 u0xdceda8d644ac18a6, ; 822: Supabase.dll => 252
	i64 u0xdd2b722d78ef5f43, ; 823: System.Runtime.dll => 117
	i64 u0xdd67031857c72f96, ; 824: lib_System.Text.Encodings.Web.dll.so => 137
	i64 u0xdd92e229ad292030, ; 825: System.Numerics.dll => 84
	i64 u0xde110ae80fa7c2e2, ; 826: System.Xml.XDocument.dll => 159
	i64 u0xde1223bb049720d1, ; 827: Supabase.Realtime => 257
	i64 u0xde572c2b2fb32f93, ; 828: lib_System.Threading.Tasks.Extensions.dll.so => 143
	i64 u0xdf25d9f36d8dc576, ; 829: lib_Supabase.Functions.dll.so => 254
	i64 u0xdf4b773de8fb1540, ; 830: System.Net.dll => 82
	i64 u0xdfa254ebb4346068, ; 831: System.Net.Ping => 70
	i64 u0xdfa4850418b6c99a, ; 832: Microsoft.AspNetCore.Hosting.Abstractions => 206
	i64 u0xdfcf7a2e1456e0b6, ; 833: Avalonia.Themes.Simple => 192
	i64 u0xdfefe13b112aff31, ; 834: lib_Avalonia.Base.dll.so => 174
	i64 u0xe0142572c095a480, ; 835: Xamarin.AndroidX.AppCompat.dll => 272
	i64 u0xe021eaa401792a05, ; 836: System.Text.Encoding.dll => 136
	i64 u0xe0be470debe77c12, ; 837: Microsoft.AspNetCore.Cryptography.Internal.dll => 202
	i64 u0xe10b760bb1462e7a, ; 838: lib_System.Security.Cryptography.Primitives.dll.so => 125
	i64 u0xe1566bbdb759c5af, ; 839: Microsoft.Maui.Controls.HotReload.Forms.dll => 318
	i64 u0xe192a588d4410686, ; 840: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 841: System.Runtime.Loader => 110
	i64 u0xe1a77eb8831f7741, ; 842: System.Security.SecureString.dll => 130
	i64 u0xe1b52f9f816c70ef, ; 843: System.Private.Xml.Linq.dll => 88
	i64 u0xe1e199c8ab02e356, ; 844: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 845: System.Net.Security.dll => 74
	i64 u0xe2252a80fe853de4, ; 846: lib_System.Security.Principal.dll.so => 129
	i64 u0xe22fa4c9c645db62, ; 847: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe24095a7afddaab3, ; 848: lib_Microsoft.Extensions.Hosting.Abstractions.dll.so => 227
	i64 u0xe2420585aeceb728, ; 849: System.Net.Requests.dll => 73
	i64 u0xe2ad448dee50fbdf, ; 850: System.Xml.Serialization => 158
	i64 u0xe2d920f978f5d85c, ; 851: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 852: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 853: Mono.Android.Export.dll => 170
	i64 u0xe38f2586e1a6af0e, ; 854: Avalonia.Controls.dll => 175
	i64 u0xe3b7cbae5ad66c75, ; 855: lib_System.Security.Cryptography.Encoding.dll.so => 123
	i64 u0xe4648f9beb38b02f, ; 856: Avalonia => 184
	i64 u0xe4f74a0b5bf9703f, ; 857: System.Runtime.Serialization.Primitives => 114
	i64 u0xe5434e8a119ceb69, ; 858: lib_Mono.Android.dll.so => 172
	i64 u0xe55703b9ce5c038a, ; 859: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 860: Microsoft.VisualBasic => 3
	i64 u0xe62913cc36bc07ec, ; 861: System.Xml.dll => 164
	i64 u0xe66e263beb16318f, ; 862: Microsoft.Extensions.WebEncoders => 234
	i64 u0xe67ddaf3b05935e8, ; 863: lib_Avalonia.Remote.Protocol.dll.so => 189
	i64 u0xe7bea09c4900a191, ; 864: Xamarin.AndroidX.VectorDrawable.dll => 304
	i64 u0xe7e03cc18dcdeb49, ; 865: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 866: lib_System.Configuration.dll.so => 19
	i64 u0xe83ddbccfc6aff3f, ; 867: Xamarin.Kotlin.StdLib.Jdk7 => 311
	i64 u0xe86b0df4ba9e5db8, ; 868: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 295
	i64 u0xe896622fe0902957, ; 869: System.Reflection.Emit.dll => 93
	i64 u0xe89a2a9ef110899b, ; 870: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 871: Microsoft.Win32.Registry => 5
	i64 u0xe93e919ce2b08636, ; 872: lib_ExCSS.dll.so => 194
	i64 u0xe98163eb702ae5c5, ; 873: Xamarin.AndroidX.Arch.Core.Runtime => 275
	i64 u0xe994f23ba4c143e5, ; 874: Xamarin.KotlinX.Coroutines.Android => 315
	i64 u0xe9b9c8c0458fd92a, ; 875: System.Windows => 155
	i64 u0xe9d166d87a7f2bdb, ; 876: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 302
	i64 u0xe9e113a80e670257, ; 877: lib_Sentry.Android.AssemblyReader.dll.so => 244
	i64 u0xed19c616b3fcb7eb, ; 878: Xamarin.AndroidX.VersionedParcelable.dll => 306
	i64 u0xed60c6fa891c051a, ; 879: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 320
	i64 u0xedc4817167106c23, ; 880: System.Net.Sockets.dll => 76
	i64 u0xedc632067fb20ff3, ; 881: System.Memory.dll => 63
	i64 u0xee81f5b3f1c4f83b, ; 882: System.Threading.ThreadPool => 147
	i64 u0xeeb7ebb80150501b, ; 883: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 277
	i64 u0xeefc635595ef57f0, ; 884: System.Security.Cryptography.Cng => 121
	i64 u0xef03b1b5a04e9709, ; 885: System.Text.Encoding.CodePages.dll => 134
	i64 u0xef602c523fe2e87a, ; 886: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 308
	i64 u0xefd1e0c4e5c9b371, ; 887: System.Resources.ResourceManager.dll => 100
	i64 u0xefe8f8d5ed3c72ea, ; 888: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 889: Xamarin.AndroidX.Activity => 268
	i64 u0xf09e47b6ae914f6e, ; 890: System.Net.NameResolution => 68
	i64 u0xf0ac2b489fed2e35, ; 891: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 892: lib_System.Net.ServicePoint.dll.so => 75
	i64 u0xf0de2537ee19c6ca, ; 893: lib_System.Net.WebHeaderCollection.dll.so => 78
	i64 u0xf1138779fa181c68, ; 894: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 294
	i64 u0xf1420dc2594163b8, ; 895: Sentry.Android.AssemblyReader => 244
	i64 u0xf153c4e48695a352, ; 896: lib_Avalonia.Controls.ColorPicker.dll.so => 186
	i64 u0xf161bf2d1e9eaff4, ; 897: lib_Microsoft.AspNetCore.DataProtection.dll.so => 204
	i64 u0xf161f4f3c3b7e62c, ; 898: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 899: System.ValueTuple => 152
	i64 u0xf1c4b4005493d871, ; 900: System.Formats.Asn1.dll => 38
	i64 u0xf2a69492c6bd46b0, ; 901: lib_Xamarin.Kotlin.StdLib.Jdk7.dll.so => 311
	i64 u0xf2feea356ba760af, ; 902: Xamarin.AndroidX.Arch.Core.Runtime.dll => 275
	i64 u0xf300e085f8acd238, ; 903: lib_System.ServiceProcess.dll.so => 133
	i64 u0xf34e52b26e7e059d, ; 904: System.Runtime.CompilerServices.VisualC.dll => 103
	i64 u0xf368e771ca059e99, ; 905: Avalonia.Android => 185
	i64 u0xf3ad9b8fb3eefd12, ; 906: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 907: System => 165
	i64 u0xf408654b2a135055, ; 908: System.Reflection.Emit.ILGeneration.dll => 91
	i64 u0xf4103170a1de5bd0, ; 909: System.Linq.Queryable.dll => 61
	i64 u0xf42ad2f4323b64d3, ; 910: Microsoft.Net.Http.Headers.dll => 240
	i64 u0xf42d20c23173d77c, ; 911: lib_System.ServiceModel.Web.dll.so => 132
	i64 u0xf4727d423e5d26f3, ; 912: SkiaSharp => 247
	i64 u0xf47e294cbe68c2b0, ; 913: lib_Websocket.Client.dll.so => 267
	i64 u0xf4c1dd70a5496a17, ; 914: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 915: System.ServiceProcess.dll => 133
	i64 u0xf518f63ead11fcd1, ; 916: System.Threading.Tasks => 145
	i64 u0xf57137e5984abfa8, ; 917: Avalonia.dll => 184
	i64 u0xf5fc7602fe27b333, ; 918: System.Net.WebHeaderCollection => 78
	i64 u0xf61ade9836ad4692, ; 919: Microsoft.IdentityModel.Tokens.dll => 238
	i64 u0xf6742cbf457c450b, ; 920: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 295
	i64 u0xf6c0e7d55a7a4e4f, ; 921: Microsoft.IdentityModel.JsonWebTokens => 236
	i64 u0xf70c0a7bf8ccf5af, ; 922: System.Web => 154
	i64 u0xf7be38c7938ad857, ; 923: Microsoft.AspNetCore.Cryptography.KeyDerivation => 203
	i64 u0xf7d5da3db84fa88c, ; 924: Supabase.Postgrest => 256
	i64 u0xf7e2cac4c45067b3, ; 925: lib_System.Numerics.Vectors.dll.so => 83
	i64 u0xf7fa0bf77fe677cc, ; 926: Newtonsoft.Json.dll => 242
	i64 u0xf8aac5ea82de1348, ; 927: System.Linq.Queryable => 61
	i64 u0xf8b77539b362d3ba, ; 928: lib_System.Reflection.Primitives.dll.so => 96
	i64 u0xf915dc29808193a1, ; 929: System.Web.HttpUtility.dll => 153
	i64 u0xf9ae35b3d65d7bb8, ; 930: Avalonia.Themes.Fluent.dll => 191
	i64 u0xf9be54c8bcf8ff3b, ; 931: System.Security.AccessControl.dll => 118
	i64 u0xf9eec5bb3a6aedc6, ; 932: Microsoft.Extensions.Options => 232
	i64 u0xfa0e82300e67f913, ; 933: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 934: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 935: lib_System.Net.Security.dll.so => 74
	i64 u0xfa504dfa0f097d72, ; 936: Microsoft.Extensions.FileProviders.Abstractions.dll => 226
	i64 u0xfa645d91e9fc4cba, ; 937: System.Threading.Thread => 146
	i64 u0xfad4d2c770e827f9, ; 938: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb022853d73b7fa5, ; 939: lib_SQLitePCLRaw.batteries_v2.dll.so => 248
	i64 u0xfb06dd2338e6f7c4, ; 940: System.Net.Ping.dll => 70
	i64 u0xfb087abe5365e3b7, ; 941: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb35173928a89083, ; 942: Supabase.Functions.dll => 254
	i64 u0xfb7a682b00f50271, ; 943: lib_Supabase.Storage.dll.so => 258
	i64 u0xfb846e949baff5ea, ; 944: System.Xml.Serialization.dll => 158
	i64 u0xfbad3e4ce4b98145, ; 945: System.Security.Cryptography.X509Certificates => 126
	i64 u0xfbba65887a38c94f, ; 946: lib_Supabase.Core.dll.so => 253
	i64 u0xfbd71978549ea473, ; 947: Microsoft.AspNetCore.Http.Features.dll => 211
	i64 u0xfbe99333ee5a53d9, ; 948: Avalonia.Vulkan => 183
	i64 u0xfbf0a31c9fc34bc4, ; 949: lib_System.Net.Http.dll.so => 65
	i64 u0xfc0ee5ac47a00750, ; 950: ExCSS => 194
	i64 u0xfc4186c2448201c7, ; 951: Avalonia.Dialogs => 177
	i64 u0xfc6b7527cc280b3f, ; 952: lib_System.Runtime.Serialization.Formatters.dll.so => 112
	i64 u0xfc70c50e7e4385e2, ; 953: Avalonia.Skia => 190
	i64 u0xfc82690c2fe2735c, ; 954: Xamarin.AndroidX.Lifecycle.Process.dll => 293
	i64 u0xfc93fc307d279893, ; 955: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 956: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfd22f00870e40ae0, ; 957: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 284
	i64 u0xfd49b3c1a76e2748, ; 958: System.Runtime.InteropServices.RuntimeInformation => 107
	i64 u0xfd536c702f64dc47, ; 959: System.Text.Encoding.Extensions => 135
	i64 u0xfd583f7657b6a1cb, ; 960: Xamarin.AndroidX.Fragment => 287
	i64 u0xfd8dd91a2c26bd5d, ; 961: Xamarin.AndroidX.Lifecycle.Runtime => 294
	i64 u0xfda36abccf05cf5c, ; 962: System.Net.WebSockets.Client => 80
	i64 u0xfddbe9695626a7f5, ; 963: Xamarin.AndroidX.Lifecycle.Common => 289
	i64 u0xfeca84fe7f34860b, ; 964: HarfBuzzSharp.dll => 195
	i64 u0xff1a4e86e72b0140, ; 965: Microsoft.AspNetCore.Authentication.Abstractions.dll => 199
	i64 u0xff270a55858bac8d, ; 966: System.Security.Principal => 129
	i64 u0xff9b54613e0d2cc8, ; 967: System.Net.Http.Json => 64
	i64 u0xffa1fe933cabf8e4, ; 968: Websocket.Client.dll => 267
	i64 u0xffb5607c2db1b7e8, ; 969: Xamarin.Kotlin.StdLib.Jdk8 => 312
	i64 u0xffd5b3e75321a00b, ; 970: Microsoft.AspNetCore.DataProtection.Abstractions => 205
	i64 u0xffdb7a971be4ec73 ; 971: System.ValueTuple.dll => 152
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [972 x i32] [
	i32 42, i32 316, i32 13, i32 265, i32 105, i32 255, i32 220, i32 171,
	i32 48, i32 272, i32 239, i32 7, i32 251, i32 205, i32 86, i32 235,
	i32 71, i32 214, i32 12, i32 262, i32 102, i32 207, i32 214, i32 195,
	i32 156, i32 19, i32 277, i32 161, i32 286, i32 234, i32 304, i32 167,
	i32 10, i32 305, i32 96, i32 284, i32 13, i32 232, i32 10, i32 127,
	i32 205, i32 95, i32 188, i32 219, i32 266, i32 140, i32 39, i32 203,
	i32 307, i32 172, i32 5, i32 67, i32 246, i32 130, i32 228, i32 0,
	i32 254, i32 261, i32 285, i32 68, i32 258, i32 243, i32 66, i32 206,
	i32 257, i32 57, i32 283, i32 52, i32 43, i32 231, i32 125, i32 67,
	i32 81, i32 320, i32 158, i32 92, i32 196, i32 99, i32 141, i32 151,
	i32 162, i32 169, i32 223, i32 81, i32 320, i32 4, i32 5, i32 51,
	i32 101, i32 259, i32 224, i32 56, i32 120, i32 98, i32 168, i32 118,
	i32 316, i32 21, i32 189, i32 137, i32 97, i32 77, i32 302, i32 119,
	i32 207, i32 176, i32 8, i32 165, i32 70, i32 300, i32 210, i32 171,
	i32 145, i32 40, i32 178, i32 186, i32 183, i32 47, i32 30, i32 191,
	i32 255, i32 144, i32 232, i32 163, i32 228, i32 28, i32 84, i32 244,
	i32 303, i32 77, i32 43, i32 257, i32 29, i32 42, i32 103, i32 117,
	i32 270, i32 45, i32 91, i32 56, i32 148, i32 319, i32 196, i32 146,
	i32 215, i32 100, i32 49, i32 20, i32 279, i32 245, i32 114, i32 248,
	i32 310, i32 233, i32 94, i32 58, i32 263, i32 81, i32 174, i32 169,
	i32 26, i32 312, i32 71, i32 299, i32 213, i32 225, i32 247, i32 178,
	i32 318, i32 69, i32 33, i32 14, i32 139, i32 263, i32 38, i32 180,
	i32 189, i32 278, i32 213, i32 241, i32 134, i32 92, i32 88, i32 149,
	i32 24, i32 138, i32 57, i32 51, i32 29, i32 157, i32 34, i32 164,
	i32 219, i32 287, i32 235, i32 52, i32 323, i32 90, i32 35, i32 157,
	i32 253, i32 9, i32 76, i32 55, i32 13, i32 274, i32 109, i32 198,
	i32 246, i32 32, i32 104, i32 84, i32 92, i32 53, i32 96, i32 198,
	i32 309, i32 58, i32 202, i32 9, i32 102, i32 283, i32 68, i32 307,
	i32 264, i32 264, i32 242, i32 226, i32 178, i32 125, i32 300, i32 116,
	i32 181, i32 135, i32 238, i32 126, i32 106, i32 310, i32 131, i32 210,
	i32 308, i32 147, i32 156, i32 279, i32 248, i32 187, i32 300, i32 97,
	i32 208, i32 24, i32 290, i32 143, i32 227, i32 256, i32 3, i32 167,
	i32 273, i32 100, i32 161, i32 99, i32 290, i32 200, i32 25, i32 212,
	i32 93, i32 168, i32 172, i32 187, i32 3, i32 286, i32 1, i32 114,
	i32 310, i32 201, i32 216, i32 293, i32 263, i32 260, i32 33, i32 260,
	i32 6, i32 224, i32 266, i32 156, i32 53, i32 176, i32 234, i32 85,
	i32 240, i32 306, i32 44, i32 177, i32 104, i32 47, i32 138, i32 64,
	i32 217, i32 175, i32 298, i32 69, i32 80, i32 262, i32 59, i32 89,
	i32 154, i32 274, i32 133, i32 110, i32 298, i32 299, i32 171, i32 134,
	i32 252, i32 140, i32 40, i32 241, i32 250, i32 238, i32 245, i32 60,
	i32 197, i32 193, i32 79, i32 25, i32 36, i32 199, i32 99, i32 71,
	i32 209, i32 22, i32 279, i32 202, i32 121, i32 69, i32 107, i32 119,
	i32 192, i32 117, i32 289, i32 204, i32 291, i32 11, i32 2, i32 124,
	i32 115, i32 142, i32 41, i32 87, i32 269, i32 249, i32 173, i32 227,
	i32 27, i32 148, i32 222, i32 240, i32 1, i32 207, i32 270, i32 197,
	i32 44, i32 149, i32 0, i32 18, i32 192, i32 86, i32 41, i32 276,
	i32 246, i32 312, i32 94, i32 229, i32 28, i32 41, i32 78, i32 285,
	i32 278, i32 144, i32 108, i32 277, i32 188, i32 11, i32 105, i32 137,
	i32 16, i32 122, i32 66, i32 157, i32 194, i32 22, i32 250, i32 102,
	i32 231, i32 222, i32 317, i32 63, i32 58, i32 110, i32 0, i32 173,
	i32 191, i32 321, i32 315, i32 9, i32 120, i32 176, i32 98, i32 245,
	i32 105, i32 111, i32 271, i32 49, i32 20, i32 282, i32 72, i32 155,
	i32 39, i32 35, i32 313, i32 38, i32 250, i32 108, i32 21, i32 186,
	i32 309, i32 258, i32 296, i32 15, i32 233, i32 79, i32 79, i32 282,
	i32 233, i32 152, i32 21, i32 255, i32 50, i32 51, i32 94, i32 225,
	i32 16, i32 265, i32 123, i32 160, i32 45, i32 116, i32 63, i32 218,
	i32 166, i32 281, i32 14, i32 301, i32 111, i32 271, i32 60, i32 314,
	i32 121, i32 2, i32 182, i32 287, i32 296, i32 313, i32 296, i32 6,
	i32 276, i32 214, i32 236, i32 17, i32 77, i32 281, i32 131, i32 309,
	i32 180, i32 83, i32 12, i32 34, i32 119, i32 266, i32 293, i32 286,
	i32 85, i32 203, i32 18, i32 211, i32 307, i32 221, i32 292, i32 184,
	i32 72, i32 319, i32 95, i32 251, i32 165, i32 288, i32 82, i32 231,
	i32 272, i32 314, i32 154, i32 36, i32 151, i32 180, i32 241, i32 235,
	i32 144, i32 56, i32 113, i32 217, i32 208, i32 247, i32 276, i32 304,
	i32 37, i32 260, i32 261, i32 115, i32 270, i32 14, i32 216, i32 146,
	i32 209, i32 43, i32 195, i32 98, i32 317, i32 168, i32 16, i32 212,
	i32 48, i32 107, i32 210, i32 211, i32 97, i32 181, i32 219, i32 298,
	i32 27, i32 128, i32 29, i32 201, i32 226, i32 128, i32 44, i32 282,
	i32 218, i32 285, i32 149, i32 8, i32 206, i32 242, i32 249, i32 132,
	i32 259, i32 185, i32 42, i32 249, i32 33, i32 323, i32 46, i32 143,
	i32 283, i32 138, i32 62, i32 132, i32 48, i32 175, i32 177, i32 160,
	i32 275, i32 289, i32 46, i32 164, i32 237, i32 288, i32 237, i32 190,
	i32 183, i32 190, i32 18, i32 8, i32 280, i32 124, i32 59, i32 141,
	i32 193, i32 294, i32 239, i32 150, i32 179, i32 259, i32 142, i32 316,
	i32 313, i32 126, i32 256, i32 315, i32 160, i32 162, i32 268, i32 221,
	i32 26, i32 292, i32 182, i32 82, i32 322, i32 127, i32 101, i32 148,
	i32 253, i32 54, i32 162, i32 179, i32 167, i32 131, i32 265, i32 37,
	i32 305, i32 193, i32 22, i32 112, i32 90, i32 50, i32 60, i32 122,
	i32 83, i32 127, i32 163, i32 262, i32 166, i32 301, i32 284, i32 295,
	i32 209, i32 4, i32 291, i32 170, i32 2, i32 116, i32 321, i32 236,
	i32 269, i32 19, i32 230, i32 89, i32 65, i32 30, i32 223, i32 59,
	i32 111, i32 292, i32 32, i32 128, i32 159, i32 200, i32 278, i32 140,
	i32 153, i32 17, i32 75, i32 74, i32 15, i32 169, i32 85, i32 314,
	i32 218, i32 124, i32 297, i32 239, i32 34, i32 228, i32 118, i32 139,
	i32 122, i32 261, i32 106, i32 319, i32 305, i32 54, i32 47, i32 28,
	i32 201, i32 213, i32 145, i32 230, i32 200, i32 311, i32 147, i32 35,
	i32 281, i32 173, i32 75, i32 161, i32 1, i32 204, i32 159, i32 12,
	i32 155, i32 196, i32 151, i32 252, i32 208, i32 76, i32 103, i32 112,
	i32 251, i32 274, i32 187, i32 65, i32 66, i32 45, i32 109, i32 199,
	i32 7, i32 273, i32 55, i32 267, i32 269, i32 198, i32 64, i32 280,
	i32 243, i32 20, i32 109, i32 101, i32 62, i32 142, i32 215, i32 268,
	i32 7, i32 237, i32 212, i32 170, i32 50, i32 115, i32 224, i32 141,
	i32 166, i32 80, i32 113, i32 215, i32 297, i32 220, i32 185, i32 17,
	i32 73, i32 89, i32 87, i32 120, i32 303, i32 188, i32 271, i32 179,
	i32 135, i32 153, i32 106, i32 11, i32 90, i32 31, i32 220, i32 136,
	i32 243, i32 302, i32 322, i32 217, i32 264, i32 40, i32 323, i32 139,
	i32 317, i32 25, i32 73, i32 290, i32 288, i32 321, i32 322, i32 27,
	i32 67, i32 88, i32 95, i32 113, i32 31, i32 104, i32 291, i32 182,
	i32 37, i32 225, i32 72, i32 308, i32 108, i32 123, i32 273, i32 87,
	i32 229, i32 86, i32 93, i32 216, i32 197, i32 223, i32 129, i32 297,
	i32 303, i32 318, i32 301, i32 280, i32 221, i32 163, i32 130, i32 230,
	i32 306, i32 174, i32 299, i32 222, i32 10, i32 49, i32 181, i32 91,
	i32 150, i32 62, i32 136, i32 150, i32 61, i32 229, i32 252, i32 117,
	i32 137, i32 84, i32 159, i32 257, i32 143, i32 254, i32 82, i32 70,
	i32 206, i32 192, i32 174, i32 272, i32 136, i32 202, i32 125, i32 318,
	i32 54, i32 110, i32 130, i32 88, i32 23, i32 74, i32 129, i32 31,
	i32 227, i32 73, i32 158, i32 23, i32 4, i32 170, i32 175, i32 123,
	i32 184, i32 114, i32 172, i32 32, i32 3, i32 164, i32 234, i32 189,
	i32 304, i32 30, i32 19, i32 311, i32 295, i32 93, i32 36, i32 5,
	i32 194, i32 275, i32 315, i32 155, i32 302, i32 244, i32 306, i32 320,
	i32 76, i32 63, i32 147, i32 277, i32 121, i32 134, i32 308, i32 100,
	i32 39, i32 268, i32 68, i32 26, i32 75, i32 78, i32 294, i32 244,
	i32 186, i32 204, i32 24, i32 152, i32 38, i32 311, i32 275, i32 133,
	i32 103, i32 185, i32 57, i32 165, i32 91, i32 61, i32 240, i32 132,
	i32 247, i32 267, i32 46, i32 133, i32 145, i32 184, i32 78, i32 238,
	i32 295, i32 236, i32 154, i32 203, i32 256, i32 83, i32 242, i32 61,
	i32 96, i32 153, i32 191, i32 118, i32 232, i32 6, i32 15, i32 74,
	i32 226, i32 146, i32 52, i32 248, i32 70, i32 23, i32 254, i32 258,
	i32 158, i32 126, i32 253, i32 211, i32 183, i32 65, i32 194, i32 177,
	i32 112, i32 190, i32 293, i32 55, i32 53, i32 284, i32 107, i32 135,
	i32 287, i32 294, i32 80, i32 289, i32 195, i32 199, i32 129, i32 64,
	i32 267, i32 312, i32 205, i32 152
], align 16

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
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 1dcfb6f8779c33b6f768c996495cb90ecd729329"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
