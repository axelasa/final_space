part of 'get_all_episodes_bloc.dart';

abstract class GetAllEpisodesState extends Equatable {
  const GetAllEpisodesState();
  @override
  List<Object> get props => [];
}

 class GetAllEpisodesInitial extends GetAllEpisodesState {}

class GetAllEpisodesLoading extends GetAllEpisodesState{
  const GetAllEpisodesLoading():super();
}

class GetAllEpisodesSuccess extends GetAllEpisodesState {
  final List<GetAllEpisodes?> episodes;

  const GetAllEpisodesSuccess(this.episodes):super();

  @override
  List<Object> get props => [episodes];
}

class GetAllEpisodesFail extends GetAllEpisodesState{
  final dynamic error;

  const GetAllEpisodesFail(this.error):super();

  @override
  List<Object> get props => [error];
}
