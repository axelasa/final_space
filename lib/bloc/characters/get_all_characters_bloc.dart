import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_space/api/api_service.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'get_all_characters_event.dart';
part 'get_all_characters_state.dart';

class GetAllCharactersBloc extends Bloc<GetAllCharactersEvent, GetAllCharactersState> {
  late final ApiService service;
  GetAllCharactersBloc(this.service) : super(GetAllCharactersInitial()) {
    on<GetAllCharactersInit>(_onGetAllCharactersInit);
  }

  Future<void> _onGetAllCharactersInit(GetAllCharactersInit event, Emitter<GetAllCharactersState> emit) async{
    try{
      emit(const GetAllCharactersLoading());

      final List<GetAllCharacters?> characters = await service.getAllCharacters();
      debugPrint('HERE IS THE MODEL ${characters.length}');
      emit( GetAllCharactersSuccess(characters));
    }catch(e){
      debugPrint(e.toString());
      emit(GetAllCharactersFail(e.toString()));
    }
  }
}
