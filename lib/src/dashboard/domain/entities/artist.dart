import 'package:equatable/equatable.dart';

class ArtistData extends Equatable {
  const ArtistData({
    required this.id,
    required this.name,
    required this.genres,
    required this.images,
    required this.followers,
    required this.popularity,
    required this.externalUrl,
    required this.uri,
  });

  const ArtistData.empty()
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

  final String id;
  final String name;
  final List<String> genres;
  final List<ImageEntity> images;
  final int followers;
  final int popularity;
  final String externalUrl;
  final String uri;

  @override
  List<Object?> get props => [
        id,
        name,
        genres,
        images,
        followers,
        popularity,
        externalUrl,
        uri,
      ];
}

class ImageEntity extends Equatable {
  const ImageEntity({
    required this.url,
    required this.height,
    required this.width,
  });

  final String url;
  final int height;
  final int width;

  @override
  List<Object?> get props => [url, height, width];
}
