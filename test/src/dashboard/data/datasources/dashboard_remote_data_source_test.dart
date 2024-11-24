import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:emoodie_music_app/src/dashboard/data/models/album_model.dart';
import 'package:emoodie_music_app/src/dashboard/data/models/artist_model.dart';
import 'package:emoodie_music_app/src/dashboard/data/datasources/dashboard_remote_data_source.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient client;
  late DashboardRemoteDatasource remoteDatasource;

  setUp(() {
    client = MockClient();
    remoteDatasource = DashboardRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  group('getAlbum', () {
    const txharsh = 'test_txharsh';
    final albumModel = [AlbumModel.empty()];

    test('should return List<Album> when the status code is 200', () async {
      // Arrange
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response(
              jsonEncode({'access_token': 'test_access_token'}), 200));
      when(() => client.get(any(), headers: any(named: 'headers'))).thenAnswer(
          (_) async => http.Response(
              jsonEncode({'albums': albumModel.map((e) => e.toMap()).toList()}),
              200));

      // Act
      final result = await remoteDatasource.getAlbum(param: txharsh);

      // Assert
      expect(result, equals(albumModel));
      verify(() => client.post(any(),
          headers: any(named: 'headers'), body: any(named: 'body'))).called(1);
      verify(() => client.get(any(), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('getArtist', () {
    const txharsh = 'test_txharsh';
    final artistModel = [ArtistModel.empty()];

    test('should return List<ArtistData> when the status code is 200',
        () async {
      // Arrange
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response(
              jsonEncode({'access_token': 'test_access_token'}), 200));
      when(() => client.get(any(), headers: any(named: 'headers'))).thenAnswer(
          (_) async => http.Response(
              jsonEncode(
                  {'artists': artistModel.map((e) => e.toMap()).toList()}),
              200));

      // Act
      final result = await remoteDatasource.getArtist(param: txharsh);

      // Assert
      expect(result, equals(artistModel));
      verify(() => client.post(any(),
          headers: any(named: 'headers'), body: any(named: 'body'))).called(1);
      verify(() => client.get(any(), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}
