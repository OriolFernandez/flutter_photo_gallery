import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_demo/data/media_repository.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final MediaRepository _repository;
  GalleryCubit(this._repository) : super(GalleryInitState());

  Future<void> getGallery() async {
    try {
      emit(GalleryInitState());
      final assets = await _repository.getMediaFiles();
      emit(GalleryLoadedState(assets));
    } on Exception {
      emit(GalleryErrorState('Error loading gallery'));
    }
  }
}
