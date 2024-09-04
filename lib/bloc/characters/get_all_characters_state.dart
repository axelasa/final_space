part of 'get_all_characters_bloc.dart';

abstract class GetAllCharactersState extends Equatable {
  const GetAllCharactersState();
  @override
  List<Object> get props => [];
}

class GetAllCharactersInitial extends GetAllCharactersState {}

class GetAllCharactersLoading extends GetAllCharactersState {
  const GetAllCharactersLoading(): super();
}

class GetAllCharactersSuccess extends GetAllCharactersState{
  final List<GetAllCharacters?> characters;

  const GetAllCharactersSuccess(this.characters):super();

  @override
  List<Object> get props => [characters];
}

class GetAllCharactersFail extends GetAllCharactersState{
  final dynamic error;

  const GetAllCharactersFail(this.error):super();

  @override
  List<Object> get props=>[error];
}