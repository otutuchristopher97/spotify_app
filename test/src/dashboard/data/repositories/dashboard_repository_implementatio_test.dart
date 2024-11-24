// import 'package:dartz/dartz.dart';
// import 'package:emoodie_music_app/src/dashboard/data/repositories/dashboard_repository_implementatio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:emoodie_music_app/core/error/exceptions.dart';
// import 'package:emoodie_music_app/core/error/failure.dart';
// import 'package:emoodie_music_app/src/dashboard/data/datasources/dashboard_remote_data_source.dart';
// import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
// import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';

// class MockDashboardRemoteDatasource extends Mock
//     implements DashboardRemoteDatasource {}

// void main() {
//   late DashboardRepositoryImplementation repository;
//   late MockDashboardRemoteDatasource mockRemoteDataSource;

//   setUp(() {
//     mockRemoteDataSource = MockDashboardRemoteDatasource();
//     repository = DashboardRepositoryImplementation(mockRemoteDataSource);
//   });

//   group('getAlbum', () {
//     const tParam = 'test_param';
//     final tAlbums = [
//       Album(
//         id: '1',
//         name: 'Test Album',
//         albumType: 'single',
//         releaseDate: '2023-01-01',
//         totalTracks: 10,
//         availableMarkets: ['US', 'CA'],
//         images: [],
//         tracks: [],
//         artists: [],
//         genres: [],
//         label: '',
//         popularity: 0,
//       ),
//     ];

//     test('should return a list of albums when the call to remote data source is successful', () async {
//       // Arrange
//       when(mockRemoteDataSource.getAlbum(param: tParam))
//           .thenAnswer((_) async => tAlbums);

//       // Act
//       final result = await repository.getAlbum(param: tParam);

//       // Assert
//       expect(result, Right(tAlbums));
//       verify(mockRemoteDataSource.getAlbum(param: tParam));
//       verifyNoMoreInteractions(mockRemoteDataSource);
//     });

//     test('should return a failure when the call to remote data source throws an APIException', () async {
//       // Arrange
//       when(mockRemoteDataSource.getAlbum(param: tParam))
//           .thenThrow(APIException(message: 'error', statusCode: 500));

//       // Act
//       final result = await repository.getAlbum(param: tParam);

//       // Assert
//       expect(result, Left(isA<Failure>()));
//       verify(mockRemoteDataSource.getAlbum(param: tParam));
//       verifyNoMoreInteractions(mockRemoteDataSource);
//     });
//   });

//   group('getArtist', () {
//     const tParam = 'test_param';
//     final tArtists = [
//       ArtistData(
//         id: '1',
//         name: 'Test Artist',
//         genres: ['Pop', 'Rock'],
//         images: [
//           ImageEntity(
//             url: 'https://example.com/image.jpg',
//             height: 300,
//             width: 300,
//           ),
//         ],
//         followers: 1000,
//         popularity: 85,
//         externalUrl: 'https://spotify.com/artist1',
//         uri: 'spotify:artist:1',
//       ),
//     ];

//     test('should return a list of artists when the call to remote data source is successful', () async {
//       // Arrange
//       when(mockRemoteDataSource.getArtist(param: tParam))
//           .thenAnswer((_) async => tArtists);

//       // Act
//       final result = await repository.getArtist(param: tParam);

//       // Assert
//       expect(result, Right(tArtists));
//       verify(mockRemoteDataSource.getArtist(param: tParam));
//       verifyNoMoreInteractions(mockRemoteDataSource);
//     });

//     test('should return a failure when the call to remote data source throws an APIException', () async {
//       // Arrange
//       when(mockRemoteDataSource.getArtist(param: tParam))
//           .thenThrow(APIException(message: 'error', statusCode: 500));

//       // Act
//       final result = await repository.getArtist(param: tParam);

//       // Assert
//       expect(result, Left(isA<Failure>()));
//       verify(mockRemoteDataSource.getArtist(param: tParam));
//       verifyNoMoreInteractions(mockRemoteDataSource);
//     });
//   });
// }
