
import 'package:emoodie_music_app/core/usercase/usecase.dart';
import 'package:emoodie_music_app/core/utils/typedef.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';
import 'package:emoodie_music_app/src/dashboard/domain/repos/auth_repo.dart';

class FetchArtist extends UsecaseWithParams<List<ArtistData>, SearchParams> {
  const FetchArtist(this._repo);

  final DashboardRepo _repo;

  @override
  ResultFuture<List<ArtistData>> call(SearchParams params)=> 
    _repo.fetchArtist(param: params.search);
    
}


