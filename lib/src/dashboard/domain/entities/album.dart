import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final String id;
  final String name;
  final String albumType;
  final String releaseDate;
  final int totalTracks;
  final List<String> availableMarkets;
  final List<ImageEntity> images;
  final List<ArtistEntity> artists;
  final TrackEntity tracks;
  final List<String> genres;
  final String label;
  final int popularity;

  const Album({
    required this.id,
    required this.name,
    required this.albumType,
    required this.releaseDate,
    required this.totalTracks,
    required this.availableMarkets,
    required this.images,
    required this.artists,
    required this.tracks,
    required this.genres,
    required this.label,
    required this.popularity,
  });

  const Album.empty()
      : this(
          id: '_empty.id',
          name: '_empty.name',
          albumType: '_empty.albumType',
          releaseDate: '_empty.releaseDate',
          totalTracks: 0,
          availableMarkets: const [],
          images: const [ImageEntity.empty()],
          artists: const [ArtistEntity.empty()],
          tracks: const TrackEntity.empty(),
          genres: const [],
          label: '_empty.label',
          popularity: 0,
        );

  @override
  List<Object?> get props => [
        id,
        name,
        albumType,
        releaseDate,
        totalTracks,
        availableMarkets,
        images,
        artists,
        tracks,
        genres,
        label,
        popularity,
      ];
}

class ImageEntity extends Equatable {
  final String url;
  final int height;
  final int width;

  const ImageEntity({
    required this.url,
    required this.height,
    required this.width,
  });

  const ImageEntity.empty()
      : this(
          url: '_empty.url',
          height: 0,
          width: 0,
        );

  @override
  List<Object?> get props => [url, height, width];
}

class ArtistEntity extends Equatable {
  final String id;
  final String name;
  final String uri;

  const ArtistEntity({
    required this.id,
    required this.name,
    required this.uri,
  });

  const ArtistEntity.empty()
      : this(
          id: '_empty.id',
          name: '_empty.name',
          uri: '_empty.uri',
        );

  @override
  List<Object?> get props => [id, name, uri];
}

class TrackEntity extends Equatable {
  final int total;

  const TrackEntity({
    required this.total,
  });

  const TrackEntity.empty() : this(total: 0);

  @override
  List<Object?> get props => [total];
}
