import 'package:dartz/dartz.dart';
import 'package:emoodie_music_app/core/error/exceptions.dart';
import 'package:emoodie_music_app/core/error/failure.dart';
import 'package:emoodie_music_app/src/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:emoodie_music_app/core/utils/typedef.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';
import 'package:emoodie_music_app/src/dashboard/domain/repos/auth_repo.dart';

class DashboardRepositoryImplementation implements DashboardRepo {
  const DashboardRepositoryImplementation(this._remoteDataSource);

  final DashboardRemoteDatasource _remoteDataSource;

  @override
  ResultFuture<List<Album>> fetchAlbum({required String param}) async {
    try {
      final result = await _remoteDataSource.getAlbum(param: param);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ArtistData>> fetchArtist({required String param}) async {
    try {
      final result = await _remoteDataSource.getArtist(param: param);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
  
}
