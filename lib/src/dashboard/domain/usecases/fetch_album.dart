
import 'package:emoodie_music_app/core/usercase/usecase.dart';
import 'package:emoodie_music_app/core/utils/typedef.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/repos/auth_repo.dart';

class FetchAlbum extends UsecaseWithParams<List<Album>, SearchParams> {
  const FetchAlbum(this._repo);

  final DashboardRepo _repo;

  @override
  ResultFuture<List<Album>> call(SearchParams params)=> 
    _repo.fetchAlbum(param: params.search);
    
}


