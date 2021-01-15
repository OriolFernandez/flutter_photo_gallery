import 'package:photo_manager/photo_manager.dart';

abstract class MediaRepository {
  Future<List<AssetEntity>> getMediaFiles();
}

class MediaRepositoryImpl extends MediaRepository {
  @override
  Future<List<AssetEntity>> getMediaFiles() {
    return _fetchAssets();
  }

  Future<List<AssetEntity>> _fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final List<AssetEntity> recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );
    return recentAssets;
  }
}
