import 'package:emoodie_music_app/src/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:emoodie_music_app/src/dashboard/data/repositories/dashboard_repository_implementatio.dart';
import 'package:emoodie_music_app/src/dashboard/domain/repos/auth_repo.dart';
import 'package:emoodie_music_app/src/dashboard/domain/usecases/fetch_album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/usecases/fetch_artist.dart';
import 'package:emoodie_music_app/src/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

part 'injection_container.main.dart';
