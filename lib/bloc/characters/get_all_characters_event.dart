part of 'get_all_characters_bloc.dart';

abstract class GetAllCharactersEvent extends Equatable {
  const GetAllCharactersEvent();
  @override
  List<Object> get props => [];
}

class GetAllCharactersInit extends GetAllCharactersEvent{
  const GetAllCharactersInit():super();
}