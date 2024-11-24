import 'package:emoodie_music_app/core/utils/typedef.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';

abstract class DashboardRepo {
  const DashboardRepo();

  ResultFuture<List<Album>> fetchAlbum({required String param});

  ResultFuture<List<ArtistData>> fetchArtist(
    {required String param}
  );

}
