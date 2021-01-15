part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {
  const GalleryState();
}

class GalleryInitState extends GalleryState {
  const GalleryInitState();
}

class GalleryLoadingState extends GalleryState {
  const GalleryLoadingState();
}

class GalleryLoadedState extends GalleryState {
  final List<AssetEntity> assets;

  const GalleryLoadedState(this.assets);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is GalleryLoadedState && o.assets == this.assets;
  }

  @override
  int get hashCode => assets.hashCode;
}

class GalleryErrorState extends GalleryState {
  final String message;
  const GalleryErrorState(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GalleryErrorState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
