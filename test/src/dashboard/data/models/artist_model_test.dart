import 'dart:convert';

import 'package:emoodie_music_app/src/dashboard/data/models/artist_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Artist Model Tests', () {
    const artistJson = '''
    {
      "id": "1",
      "name": "Artist Name",
      "genres": ["Rock", "Pop"],
      "images": [
        {
          "url": "https://example.com/image.jpg",
          "height": 300,
          "width": 300
        }
      ],
      "followers": {
        "total": 1000
      },
      "popularity": 50,
      "external_urls": {
        "spotify": "https://spotify.com/artist1"
      },
      "uri": "spotify:artist:1"
    }
    ''';

    test('fromJson should parse JSON correctly', () {
      final artist = ArtistModel.fromJson(artistJson);

      expect(artist.id, '1');
      expect(artist.name, 'Artist Name');
      expect(artist.genres, ['Rock', 'Pop']);
      expect(artist.images.first.url, 'https://example.com/image.jpg');
      expect(artist.images.first.height, 300);
      expect(artist.images.first.width, 300);
      expect(artist.followers, 1000);
      expect(artist.popularity, 50);
      expect(artist.externalUrl, 'https://spotify.com/artist1');
      expect(artist.uri, 'spotify:artist:1');
    });

    test('toJson should serialize model correctly', () {
      const artist = ArtistModel(
        id: '1',
        name: 'Artist Name',
        genres: ['Rock', 'Pop'],
        images: [
          ImageModel(
              url: 'https://example.com/image.jpg', height: 300, width: 300)
        ],
        followers: 1000,
        popularity: 50,
        externalUrl: 'https://spotify.com/artist1',
        uri: 'spotify:artist:1',
      );

      final json = artist.toJson();
      final expectedMap = {
        'id': '1',
        'name': 'Artist Name',
        'genres': ['Rock', 'Pop'],
        'images': [
          {
            'url': 'https://example.com/image.jpg',
            'height': 300,
            'width': 300,
          }
        ],
        'followers': {'total': 1000},
        'popularity': 50,
        'external_urls': {'spotify': 'https://spotify.com/artist1'},
        'uri': 'spotify:artist:1',
      };

      final expectedJson =
          jsonEncode(expectedMap); // Convert expectedMap to JSON string.

      expect(json, equals(expectedJson)); // Compare the JSON strings.
    });
  });
}
