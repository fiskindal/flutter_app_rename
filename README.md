# Flutter App Rename 

flutter allows you to change the name of the application
# Usage

1. Set your dev dependencies and your app's name and id (aka bundleId or applicationId, previously: package name)

```
dev_dependencies:
  flutter_app_rename: ^0.1.2

flutter_app_rename:
  name: "My Cool App"
  id: "com.example.flutter_app_name"
```

2. Run flutter_app_rename in your project's directory

```
flutter pub get
flutter pub run flutter_app_rename
```

# Test

Run the test suite with

`pub run test`
