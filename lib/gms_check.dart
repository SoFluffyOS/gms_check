import 'dart:async';

import 'package:flutter/services.dart'
    show MethodChannel, MissingPluginException, PlatformException;
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding, debugPrint;

const String _channelName = 'com.github.simonpham.gms_check';

/// For Google Play Services check to prevent app crashing.
class GmsCheck {
  static const MethodChannel _channel = MethodChannel(_channelName);
  static const _isGmsAvailableMethod = 'isGmsAvailable';

  static final GmsCheck _instance = GmsCheck._internal();

  factory GmsCheck() => _instance;

  GmsCheck._internal();

  bool? _isGmsAvailable;

  bool get isGmsAvailable {
    if (_isGmsAvailable == null) {
      throw Exception(
          '[GMS Availability]: checkGmsAvailability() needed to call before using GmsTools().isGmsAvailable.');
    }
    return _isGmsAvailable ?? true;
  }

  /// Just need to call this once when app initialize.
  /// Then use GmsTools().isGmsAvailable getter instead.
  Future<bool?> checkGmsAvailability({bool enableLog = false}) async {
    WidgetsFlutterBinding.ensureInitialized();

    _isGmsAvailable = false;

    try {
      final status = await _channel.invokeMethod(_isGmsAvailableMethod);
      if (enableLog) {
        debugPrint('[GMS Availability]: ${status.toString()}');
      }
      _isGmsAvailable = status;
    } on PlatformException {
      if (enableLog) {
        debugPrint('[GMS Availability]: Failed to get isGmsAvailable.');
      }
    } on MissingPluginException {
      /// Just need to check for Android.
      /// Default true for other OS.
      _isGmsAvailable = true;
    }
    return _isGmsAvailable;
  }
}
