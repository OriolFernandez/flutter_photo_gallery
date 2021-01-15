import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_demo/bloc/gallery_cubit.dart';
import 'package:photo_manager_demo/data/media_repository.dart';
import 'package:photo_manager_demo/widgets/asset_thumbnail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      home: BlocProvider(
        create: (context) {
          GalleryCubit cubit = GalleryCubit(MediaRepositoryImpl());
          cubit.getGallery();
          return cubit;
        },
        child: _schafold(context),
      ),
    );
  }

  Widget _schafold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Gallery'),
        ),
        body: BlocBuilder<GalleryCubit, GalleryState>(
          builder: (context, state) {
            Widget resultWidget;
            if (state is GalleryLoadedState) {
              resultWidget = _grid(state.assets);
            } else if (state is GalleryLoadingState) {
              resultWidget = _loading();
            } else if (state is GalleryErrorState) {
              resultWidget = _error();
            } else {
              resultWidget = _loading();
            }
            return resultWidget;
          },
        ),
      );

  Widget _grid(List<AssetEntity> assets) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // A grid view with 3 items per row
          crossAxisCount: 4,
        ),
        itemCount: assets.length,
        itemBuilder: (_, index) {
          return AssetThumbnail(asset: assets[index]);
        },
      );

  Widget _loading() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _error() => Center(
        child: Text('Error'),
      );
}
