library flutter_app_name;

import "package:rename/rename.dart";

import "context.dart";
import "common.dart";
import 'iosAndMacOS.dart' as macosAndIos;
import "android.dart" as android;
import 'web.dart' as web;
import 'windows.dart' as windows;

void run() {
  final context = Context(
    yamlKeyName: "flutter_app_rename",
    pubspecPath: "pubspec.yaml",
    infoPlistPath: "ios/Runner/Info.plist",
    androidManifestPath: "android/app/src/main/AndroidManifest.xml",
    webManifestPath: "web/manifest.json",
    macosPlistPath: "macos/Runner/Info.plist",
  );

  macosAndIos.updateLauncherName(context);
  android.updateLauncherName(context);
  windows.updateLauncherName(context);
  macosAndIos.updateLauncherName(context);
  web.updateLauncherName(context);
  final id = fetchId(context);
  if (id != null) {
    changeBundleId(id, <Platform>[]);
  }
}
