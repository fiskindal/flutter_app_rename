import "package:xml/xml.dart";
import 'common.dart' as common;

import "context.dart";
import 'dart:io';

//  windows/CMakeLists.txt klasöründeki dosyadaki  proje adı değişecek

String fetchCurrentBundleName(Context context, String manifestFileData) {
  final parsed = XmlDocument.parse(manifestFileData);

  final application = parsed.findAllElements("application").toList()[0];

  final List<String> label = application.attributes
      .where((attrib) => attrib.toString().contains("android:label"))
      .map((i) => i.toString())
      .toList();

  if (label.isEmpty) {
    throw Exception(
        "Could not find android:label in ${context.androidManifestPath}");
  }

  return label[0];
}

//  windows/CMakeLists.txt klasöründeki dosyadaki  proje adı değişecek
String setNewBundleName(Context context, String manifestFileData,
    String currentBundleName, String desiredBundleName) {
  final parsed = XmlDocument.parse(manifestFileData);
  final application = parsed.findAllElements("application").toList()[0];
  final List<String> label = application.attributes
      .where((attrib) => attrib.toString().contains("android:label"))
      .map((i) => i.toString())
      .toList();
  if (label.isEmpty) {
    throw Exception(
        "Could not find android:label in ${context.androidManifestPath}");
  }

  final String updatedManifestData = manifestFileData.replaceAll(
      currentBundleName, 'android:label="${desiredBundleName}"');

  return updatedManifestData;
}

void updateLauncherName(Context context) {
  final String manifestFileData = common.readFile(context.androidManifestPath);
  final String desiredBundleName = common.fetchLauncherName(context);
  final String currentBundleName =
      fetchCurrentBundleName(context, manifestFileData);
  final String updatedManifestData = setNewBundleName(
      context, manifestFileData, currentBundleName, desiredBundleName);

  common.overwriteFile(context.androidManifestPath, updatedManifestData);
}
