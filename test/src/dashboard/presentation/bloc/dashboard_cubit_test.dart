import 'package:emoodie_music_app/core/error/failure.dart';
import 'package:emoodie_music_app/core/usercase/usecase.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';
import 'package:emoodie_music_app/src/dashboard/domain/usecases/fetch_album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/usecases/fetch_artist.dart';
import 'package:emoodie_music_app/src/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

// Mock classes
class MockFetchAlbum extends Mock implements FetchAlbum {}
class MockFetchArtist extends Mock implements FetchArtist {}

void main() {
  late FetchAlbum fetchAlbum;
  late FetchArtist fetchArtist;
  late DashboardCubit cubit;

  const tAlbumParams = SearchParams.empty();
  const tArtistParams = SearchParams.empty();
  const tAPIFailure = APIFailure(message: '400 Error: message', statusCode: 400);

  setUp(() {
    fetchAlbum = MockFetchAlbum();
    fetchArtist = MockFetchArtist();
    cubit = DashboardCubit(
      fetchAlbum: fetchAlbum,
      fetchArtist: fetchArtist,
    );

    registerFallbackValue(tAlbumParams);
    registerFallbackValue(tArtistParams);
  });

  tearDown(() => cubit.close());

  const album = [Album.empty()];
  const artist = [ArtistData.empty()];

  test('initial state should be [AuthenticationInitial]', () {
    expect(cubit.state, const DashboardInitial());
  });

  group('fetchAlbum', () {
    blocTest<DashboardCubit, DashboardState>(
      'should emit [DashboardLoading, DashboardFetchAlbum] when successful',
      build: () {
        when(() => fetchAlbum(any())).thenAnswer((_) async => const Right(album));
        when(() => fetchArtist(any())).thenAnswer((_) async => const Right(artist));

        return cubit;
      },
      act: (cubit) => cubit.getAlbumList(param: '', type: 'Api'),
      expect: () => [
        const DashboardLoading(),
        const DashboardFetchAlbum(album, [], 'Api')
      ],
      verify: (_) {
        verify(() => fetchAlbum(any())).called(1);
      },
    );

    blocTest<DashboardCubit, DashboardState>(
      'should emit [DashboardLoading, DashboardError] when failure',
      build: () {
        when(() => fetchAlbum(any())).thenAnswer((_) async => const Left(tAPIFailure));

        return cubit;
      },
      act: (cubit) => cubit.getAlbumList(param: '', type: 'Api'),
      expect: () => [
        const DashboardLoading(),
        DashboardError(tAPIFailure.message),
      ],
      verify: (_) {
        verify(() => fetchAlbum(any())).called(1);
      },
    );
  });

  group('fetchArtists', () {
    blocTest<DashboardCubit, DashboardState>(
      'should emit [DashboardLoading, DashboardFetchArtist] when successful',
      build: () {
        when(() => fetchArtist(any())).thenAnswer((_) async => const Right(artist));

        return cubit;
      },
      act: (cubit) => cubit.getArtistList(param: '', type: 'Api'),
      expect: () => [
        const DashboardLoading(),
        const DashboardFetchArtist(artist, [], 'Api')
      ],
      verify: (_) {
        verify(() => fetchArtist(any())).called(1);
      },
    );

    blocTest<DashboardCubit, DashboardState>(
      'should emit [DashboardLoading, DashboardError] when failure',
      build: () {
        when(() => fetchArtist(any())).thenAnswer((_) async => const Left(tAPIFailure));

        return cubit;
      },
      act: (cubit) => cubit.getArtistList(param: '', type: 'Api'),
      expect: () => [
        const DashboardLoading(),
        DashboardError(tAPIFailure.message),
      ],
      verify: (_) {
        verify(() => fetchArtist(any())).called(1);
      },
    );
  });
}