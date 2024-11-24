import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';

class AlbumModel extends Album {
  const AlbumModel({
    required super.id,
    required super.name,
    required super.albumType,
    required super.releaseDate,
    required super.totalTracks,
    required super.availableMarkets,
    required super.images,
    required super.artists,
    required super.tracks,
    required super.genres,
    required super.label,
    required super.popularity,
  });

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      id: map['id'] as String,
      name: map['name'] as String,
      albumType: map['album_type'] as String,
      releaseDate: map['release_date'] as String,
      totalTracks: map['total_tracks'] as int,
      availableMarkets: List<String>.from(map['available_markets'] ?? []),
      images: (map['images'] as List<dynamic>)
          .map((image) => ImageEntity(
                url: image['url'] as String,
                height: image['height'] as int,
                width: image['width'] as int,
              ))
          .toList(),
      artists: (map['artists'] as List<dynamic>)
          .map((artist) => ArtistEntity(
                id: artist['id'] as String,
                name: artist['name'] as String,
                uri: artist['uri'] as String,
              ))
          .toList(),
      tracks: TrackEntity(
        total: map['tracks']['total'] as int,
      ),
      genres: List<String>.from(map['genres'] ?? []),
      label: map['label'] as String,
      popularity: map['popularity'] as int,
    );
  }

  const AlbumModel.empty()
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'album_type': albumType,
      'release_date': releaseDate,
      'total_tracks': totalTracks,
      'available_markets': availableMarkets,
      'images': images.map((image) => {
            'url': image.url,
            'height': image.height,
            'width': image.width,
          }).toList(),
      'artists': artists.map((artist) => {
            'id': artist.id,
            'name': artist.name,
            'uri': artist.uri,
          }).toList(),
      'tracks': {'total': tracks.total},
      'genres': genres,
      'label': label,
      'popularity': popularity,
    };
  }

}
