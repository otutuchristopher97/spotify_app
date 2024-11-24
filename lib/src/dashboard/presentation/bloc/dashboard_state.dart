part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

class DashboardFetchAlbum extends DashboardState {
  const DashboardFetchAlbum(this.album, this.filteredAlbums, this.type);

  final List<Album> album;
  final List<Album> filteredAlbums;
  final String type;

  @override
  List<Object> get props => [album, filteredAlbums, type];
}

class DashboardFetchArtist extends DashboardState {
  const DashboardFetchArtist(this.artist, this.filteredArtists, this.type);

  final List<ArtistData> artist;
  final List<ArtistData> filteredArtists;
  final String type;

  @override
  List<Object> get props => [artist,filteredArtists, type];
}

class DashboardError extends DashboardState {
  const DashboardError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}


