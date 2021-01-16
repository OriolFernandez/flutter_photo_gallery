import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_demo/pages/image_page.dart';
import 'package:photo_manager_demo/pages/video_page.dart';

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final AssetEntity asset;

  @override
  Widget build(BuildContext context) {
    // We're using a FutureBuilder since thumbData is a future
    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) return CircularProgressIndicator();
        // If there's data, display it as an image
        return InkWell(
          onTap: () {
            switch (asset.type) {
              case AssetType.image:
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImagePage(imageFile: asset.file)),
                  );
                  break;
                }
              case AssetType.video:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoPage(videoFile: asset.file)),
                );
                break;
              case AssetType.audio:
                // TODO: Handle this case.
                break;
              case AssetType.other:
                // TODO: Handle this case.
                break;
            }
          },
          child: Stack(
            children: [
              // Wrap the image in a Positioned.fill to fill the space
              Positioned.fill(
                child: Image.memory(bytes, fit: BoxFit.cover),
              ),
              // Display a Play icon if the asset is a video
              if (asset.type == AssetType.video)
                Center(
                  child: Container(
                    color: Colors.blue,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
