# Flutter App Rename 

flutter allows you to change the name of the application
# Usage

1. Set your dev dependencies and your app's name and id (aka bundleId or applicationId, previously: package name)

```
dev_dependencies:
  flutter_app_rename: ^0.1.2

flutter_app_rename:
  name: "My Cool App"
<<<<<<< HEAD
  id: "com.ffols.flutter_app_name"
=======
  id: "com.example.flutter_app_name"
>>>>>>> c16d7d7b47ce5b2fbd63d5f77dc32c91aacec037
```

2. Run flutter_app_rename in your project's directory

```
flutter pub get
flutter pub run flutter_app_rename
```

# Test

Run the test suite with

`pub run test`
