import "package:xml/xml.dart";
import 'common.dart' as common;

import "context.dart";
import 'dart:convert';

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

//  web/manifest.json içindeki name değişecek
String setNewBundleName(Context context, String manifestFileData,
    String currentBundleName, String desiredBundleName) {
  final parsed = jsonDecode(manifestFileData);
  parsed['name'] = desiredBundleName;
  return jsonEncode(parsed);
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

void updateWebName(Context context) {
  final String manifestFileData = common.readFile(context.infoPlistPath);
  final String desiredBundleName = common.fetchLauncherName(context);
  final String currentBundleName =
      fetchCurrentBundleName(context, manifestFileData);
  final String updatedManifestData = setNewBundleName(
      context, manifestFileData, currentBundleName, desiredBundleName);

  common.overwriteFile(context.infoPlistPath, updatedManifestData);
}
