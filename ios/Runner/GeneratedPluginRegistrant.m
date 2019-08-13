//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <file_picker/FilePickerPlugin.h>
#import <flutter_downloader/FlutterDownloaderPlugin.h>
#import <keyboard_visibility/KeyboardVisibilityPlugin.h>
#import <path_provider/PathProviderPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FilePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FilePickerPlugin"]];
  [FlutterDownloaderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterDownloaderPlugin"]];
  [FLTKeyboardVisibilityPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTKeyboardVisibilityPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
