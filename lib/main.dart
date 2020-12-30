import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_demo/widgets/gallery.dart';

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
            return RaisedButton(
              onPressed: () async {
                // ### Add the next 2 lines ###
                final permitted = await PhotoManager.requestPermission();
                if (!permitted) return;
                // ######
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => Gallery()),
                );
              },
              child: Text('Open Gallery'),
            );
          }),
        ),
      ),
    );
  }
}
