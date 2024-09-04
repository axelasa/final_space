part of 'get_all_episodes_bloc.dart';

abstract class GetAllEpisodesEvent extends Equatable {
  const GetAllEpisodesEvent();
  @override
  List<Object> get props => [];
}

class GetAllEpisodesInfo extends GetAllEpisodesEvent{
  const GetAllEpisodesInfo():super();
}
