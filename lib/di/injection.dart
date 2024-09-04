import 'package:final_space/bloc/episodes/get_all_episodes_bloc.dart';
import 'package:final_space/bloc/locations/get_all_locations_bloc.dart';
import 'package:final_space/bloc/quotes/get_all_quotes_bloc.dart';
import 'package:get_it/get_it.dart';
import '../api/api_service.dart';
import '../bloc/characters/get_all_characters_bloc.dart';


final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<GetAllCharactersBloc>(
          () => GetAllCharactersBloc(ApiService()));
  getIt.registerLazySingleton<GetAllEpisodesBloc>(
          () => GetAllEpisodesBloc(ApiService()));
  getIt.registerLazySingleton<GetAllLocationsBloc>(
          () => GetAllLocationsBloc(ApiService()));
  getIt.registerLazySingleton<GetAllQuotesBloc>(
          () => GetAllQuotesBloc(ApiService()));
}