import 'dart:convert';

import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';

class ArtistModel extends ArtistData {
  const ArtistModel({
    required super.id,
    required super.name,
    required super.genres,
    required super.images,
    required super.followers,
    required super.popularity,
    required super.externalUrl,
    required super.uri,
  });

  factory ArtistModel.fromJson(String source) =>
      ArtistModel.fromMap(jsonDecode(source));

  factory ArtistModel.fromMap(Map<String, dynamic> map) {
    return ArtistModel(
      id: map['id'] as String,
      name: map['name'] as String,
      genres: List<String>.from(map['genres'] ?? []),
      images: (map['images'] as List<dynamic>)
          .map((img) => ImageModel.fromMap(img))
          .toList(),
      followers: map['followers']['total'] as int? ?? 0,
      popularity: map['popularity'] as int? ?? 0,
      externalUrl: map['external_urls']['spotify'] as String,
      uri: map['uri'] as String,
    );
  }

  const ArtistModel.empty()
      : this(
          id: '_empty.id',
          name: '_empty.name',
          genres: const [],
          images: const [],
          followers: 0,
          popularity: 0,
          externalUrl: '_empty.externalUrl',
          uri: '_empty.uri',
        );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'genres': genres,
        'images': images.map((img) => (img as ImageModel).toMap()).toList(),
        'followers': {'total': followers},
        'popularity': popularity,
        'external_urls': {'spotify': externalUrl},
        'uri': uri,
      };
}

class ImageModel extends ImageEntity {
  const ImageModel({
    required super.url,
    required super.height,
    required super.width,
  });

  factory ImageModel.fromMap(Map<String, dynamic> map) => ImageModel(
        url: map['url'] as String,
        height: map['height'] as int,
        width: map['width'] as int,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'height': height,
        'width': width,
      };
}
