import 'package:dartz/dartz.dart';
import 'package:emoodie_music_app/core/usercase/usecase.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/repos/auth_repo.dart';
import 'package:emoodie_music_app/src/dashboard/domain/usecases/fetch_album.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository.mock.dart';

void main() {
  late FetchAlbum usecase;
  late DashboardRepo repository;

  setUp(() {
    repository = MockAuthRepo();

    // Default fallback behavior for fetchAlbum
    when(repository.fetchAlbum(param: ''))
        .thenAnswer((_) async => const Right([Album.empty()]));

    usecase = FetchAlbum(repository);
  });

  const albumList = [Album.empty()];
  const params = SearchParams.empty();

  test('should call the [Repository.fetchAlbum]', () async {
    // Arrange
    when(repository.fetchAlbum(param: ''))
        .thenAnswer((_) async => const Right(albumList));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(const Right<dynamic, List<Album>>(albumList)));
    verify(repository.fetchAlbum(param: '')).called(1);
    verifyNoMoreInteractions(repository);
  });
}
