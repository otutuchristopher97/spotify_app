import 'package:flutter_test/flutter_test.dart';
import 'package:emoodie_music_app/src/dashboard/data/models/album_model.dart';

import '../../../../fixture/json_loader.dart';

void main() {
  late List<Map<String, dynamic>> jsonData;

  setUp(() async {
    jsonData = await loadJson('albums.json'); // Ensure the JSON file is in the correct path.
  });

  group('AlbumModel Tests', () {
    test('should deserialize correctly from JSON', () {
      // Arrange
      final map = jsonData.first;

      // Act
      final albumModel = AlbumModel.fromMap(map);

      // Assert
      expect(albumModel.id, '2up3OPMp9Tb4dAKM2erWXQ');
      expect(albumModel.name, 'string');
      expect(albumModel.albumType, 'compilation');
      expect(albumModel.releaseDate, '1981-12');
      expect(albumModel.totalTracks, 9);
      expect(albumModel.availableMarkets, ['CA', 'BR', 'IT']);
      expect(albumModel.images.first.url, 'https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228');
      expect(albumModel.artists.first.name, 'string');
      expect(albumModel.tracks.total, 4);
      expect(albumModel.genres, ['Egg punk', 'Noise rock']);
      expect(albumModel.label, 'string');
      expect(albumModel.popularity, 0);
    });

  });

}
