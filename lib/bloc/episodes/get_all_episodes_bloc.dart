import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:flutter/cupertino.dart';

import '../../api/api_service.dart';

part 'get_all_episodes_event.dart';
part 'get_all_episodes_state.dart';

class GetAllEpisodesBloc extends Bloc<GetAllEpisodesEvent, GetAllEpisodesState> {
  late final ApiService service;
  GetAllEpisodesBloc(this.service) : super(GetAllEpisodesInitial()) {
    on<GetAllEpisodesInfo>(_onGetAllEpisodesInfo);
  }

  Future <void> _onGetAllEpisodesInfo(GetAllEpisodesInfo event, Emitter<GetAllEpisodesState> emit) async {

    try{
      emit(const GetAllEpisodesLoading());

      final List<GetAllEpisodes?> episode = await service.getAllEpisodes();

      emit(GetAllEpisodesSuccess(episode));
    }catch(e){
      debugPrint(e.toString());
      emit(GetAllEpisodesFail(e.toString()));
    }
  }
}
