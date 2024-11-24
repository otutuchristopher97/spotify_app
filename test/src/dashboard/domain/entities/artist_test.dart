import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Artist Entity Tests', () {
    test('Two Artist entities with the same properties should be equal', () {
      const artist1 = ArtistData(
        id: '1',
        name: 'Artist Name',
        genres: ['Rock', 'Pop'],
        images: [],
        followers: 1000,
        popularity: 50,
        externalUrl: 'https://spotify.com/artist1',
        uri: 'spotify:artist:1',
      );

      const artist2 = ArtistData(
        id: '1',
        name: 'Artist Name',
        genres: ['Rock', 'Pop'],
        images: [],
        followers: 1000,
        popularity: 50,
        externalUrl: 'https://spotify.com/artist1',
        uri: 'spotify:artist:1',
      );

      expect(artist1, equals(artist2));
    });

    test('Empty Artist should have default values', () {
      const emptyArtist = ArtistData.empty();

      expect(emptyArtist.id, '_empty.id');
      expect(emptyArtist.name, '_empty.name');
      expect(emptyArtist.genres, isEmpty);
      expect(emptyArtist.images, isEmpty);
      expect(emptyArtist.followers, 0);
      expect(emptyArtist.popularity, 0);
      expect(emptyArtist.externalUrl, '_empty.externalUrl');
      expect(emptyArtist.uri, '_empty.uri');
    });
  });
}
