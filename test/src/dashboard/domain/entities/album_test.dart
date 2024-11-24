import 'package:flutter_test/flutter_test.dart';
import 'package:emoodie_music_app/src/dashboard/data/models/album_model.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';

import '../../../../fixture/json_loader.dart';

void main() {
  late List<Map<String, dynamic>> jsonData;

  setUp(() async {
    jsonData = await loadJson('albums.json');
  });

  group('Album Tests', () {
    test('AlbumModel should extend Album and behave as expected', () {
      // Arrange
      final map = jsonData.first;

      // Act
      final albumModel = AlbumModel.fromMap(map);

      // Assert
      expect(albumModel is Album, true); 
      expect(albumModel.id, '2up3OPMp9Tb4dAKM2erWXQ');
      expect(albumModel.artists.first.name, 'string');
    });
  });
}
