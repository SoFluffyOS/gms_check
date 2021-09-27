# gms_check

**This tiny plugin simply checks if Google Services is available on the Android device.**

For other platform, it always return `true` as default.

## Usage

1. Call `await GmsCheck().checkGmsAvailability()` before `runApp()` in `main()`.

```dart
Future<void> main() async {
  /// Need to call GmsCheck().checkGmsAvailability()
  /// only once before runApp function.
  await GmsCheck().checkGmsAvailability();

  runApp(const MyApp());
}
```

2. Use `GmsCheck().isGmsAvailable` any where in the app.

```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('GMS available: ${GmsCheck().isGmsAvailable}'),
        ),
      ),
    );
  }
```

