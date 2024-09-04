import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:flutter/cupertino.dart';

import '../../api/api_service.dart';

part 'get_all_locations_event.dart';
part 'get_all_locations_state.dart';

class GetAllLocationsBloc extends Bloc<GetAllLocationsEvent, GetAllLocationsState> {
  late final ApiService service;
  GetAllLocationsBloc(this.service) : super(GetAllLocationsInitial()) {
    on<GetAllLocationsInfo>(_onGetAllLocationsInfo);
  }

  Future <void> _onGetAllLocationsInfo(GetAllLocationsInfo event, Emitter<GetAllLocationsState> emit) async {

    try{
      emit(const GetAllLocationsLoading());

      final List<GetAllLocations?> location = await service.getAllLocations();

      emit(GetAllLocationsSuccess(location));

    }catch(e){
      debugPrint(e.toString());
      emit(GetAllLocationsFail(e.toString()));
    }
  }
}
