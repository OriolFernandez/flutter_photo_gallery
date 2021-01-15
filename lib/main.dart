import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_demo/pages/gallery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Manager Demo',
      home: Material(
        child: Center(
          child: Builder(builder: (context) {
            askForPermission(context);
            return Text('Open Gallery');
          }),
        ),
      ),
    );
  }

  void askForPermission(BuildContext context) async {
    await PhotoManager.requestPermission();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Gallery()),
    );
  }
}
