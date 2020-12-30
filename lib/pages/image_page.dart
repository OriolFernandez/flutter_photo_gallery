import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager_demo/widgets/image_screen.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({
    Key key,
    @required this.imageFile,
  }) : super(key: key);
  final Future<File> imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: ImageScreen(
        imageFile: imageFile,
      ),
    );
  }
}
