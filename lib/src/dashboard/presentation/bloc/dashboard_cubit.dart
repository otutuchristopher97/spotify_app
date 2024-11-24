import 'package:bloc/bloc.dart';
import 'package:emoodie_music_app/core/usercase/usecase.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';
import 'package:emoodie_music_app/src/dashboard/domain/usecases/fetch_album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/usecases/fetch_artist.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required FetchAlbum fetchAlbum,
    required FetchArtist fetchArtist,
  })  : _fetchAlbum = fetchAlbum,
        _fetchArtist = fetchArtist,
        super(const DashboardInitial());

  final FetchAlbum _fetchAlbum;
  final FetchArtist _fetchArtist;

  Future<void> getAlbumList(
      {required String param, required String type}) async {
    emit(const DashboardLoading());

    final result = await _fetchAlbum(SearchParams(search: param));

    result.fold((failure) => emit(DashboardError(failure.message)),
        (albumList) async {
      emit(DashboardFetchAlbum(albumList, const [], 'Api'));
    });
  }

  Future<void> getArtistList(
      {required String param, required String type}) async {
    emit(const DashboardLoading());

    final result = await _fetchArtist(SearchParams(search: param));

    result.fold((failure) => emit(DashboardError(failure.message)),
        (artistList) async {
      emit(DashboardFetchArtist(artistList, const [], 'Api'));
    });
  }

  Future<void> searchAlbumList(
      {required String param,
      required List<Album> album,
      required String type}) async {
    try {
      final filteredAlbums = album.where((item) {
        return item.name.toLowerCase().startsWith(param.toLowerCase());
      }).toList();

      emit(DashboardFetchAlbum(album, filteredAlbums, type));
    } catch (error) {
      emit(DashboardError(error.toString()));
    }
  }

  Future<void> searchArtistList(
      {required String param,
      required List<ArtistData> artist,
      required String type}) async {
    try {
      final filteredArtist = artist.where((item) {
        return item.name.toLowerCase().startsWith(param.toLowerCase());
      }).toList();

      emit(DashboardFetchArtist(artist, filteredArtist, type));
    } catch (error) {
      emit(DashboardError(error.toString()));
    }
  }
}
