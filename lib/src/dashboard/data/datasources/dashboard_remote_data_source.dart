import 'dart:convert';

import 'package:emoodie_music_app/core/error/exceptions.dart';
import 'package:emoodie_music_app/core/utils/constants.dart';
import 'package:emoodie_music_app/core/utils/typedef.dart';
import 'package:emoodie_music_app/src/dashboard/data/models/album_model.dart';
import 'package:emoodie_music_app/src/dashboard/data/models/artist_model.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:http/http.dart' as http;

abstract class DashboardRemoteDatasource {
  Future<List<Album>> getAlbum({required String param});
  Future<List<ArtistData>> getArtist({required String param});
}

class DashboardRemoteDataSrcImpl implements DashboardRemoteDatasource {
  const DashboardRemoteDataSrcImpl(this._client);

  final http.Client _client;

  Future<String> getSpotifyAccessToken() async {
    
    const tokenUrl = 'https://accounts.spotify.com/api/token';
    print(tokenUrl);

    // Encode client ID and secret to Base64
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}';

    // Make the POST request to get the token
    final response = await _client.post(
      Uri.parse(tokenUrl),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // print(data);
      return data['access_token']; // Return the access token
    } else {
      throw Exception('Failed to obtain access token: ${response.body}');
    }
  }

  @override
  Future<List<Album>> getAlbum({required String param}) async {
    final String accessToken = await getSpotifyAccessToken();
    
    var url = Uri.parse('$KBaseUrl/v1/albums/?ids=$albumIds');
    try {
      final response =
          await _client.get(url,
              headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $accessToken',});
      
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      
      List<Album>  data =  List<DataMap>.from(jsonDecode(response.body)['albums'] as List)
          .map((data) => AlbumModel.fromMap(data))
          .toList();
      
      return data;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<ArtistData>> getArtist({required String param}) async {
    final String accessToken = await getSpotifyAccessToken();
    
    var url = Uri.parse('$KBaseUrl/v1/artists/?ids=$artistIds');
    try {
      final response =
          await _client.get(url,
              headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $accessToken',});
      
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      
      List<ArtistData>  data =  List<DataMap>.from(jsonDecode(response.body)['artists'] as List)
          .map((data) => ArtistModel.fromMap(data))
          .toList();
      return data;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
