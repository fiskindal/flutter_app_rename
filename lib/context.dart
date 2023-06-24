class Context {
  final String infoPlistPath;
  final String macosPlistPath;
  final String webManifestPath;
  final String androidManifestPath;
  final String pubspecPath;
  final String yamlKeyName;

  Context({
    required this.macosPlistPath,
    required this.webManifestPath,
    required this.yamlKeyName,
    required this.androidManifestPath,
    required this.pubspecPath,
    required this.infoPlistPath,
  });
}
