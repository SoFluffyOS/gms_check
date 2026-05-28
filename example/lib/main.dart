import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gms_check/gms_check.dart';

Future<void> main() async {
  /// Need to call GmsCheck().checkGmsAvailability()
  /// only once before runApp function.
  await GmsCheck().checkGmsAvailability();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Text('GMS available: ${GmsCheck().isGmsAvailable}\n'),
        ),
      ),
    );
  }
}
