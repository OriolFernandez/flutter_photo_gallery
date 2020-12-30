import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager_demo/widgets/video_screen.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({
    Key key,
    @required this.videoFile,
  }) : super(key: key);
  final Future<File> videoFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: VideoScreen(
        videoFile: videoFile,
      ),
    );
  }
}
