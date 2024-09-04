import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:flutter/cupertino.dart';

import '../../api/api_service.dart';

part 'get_all_quotes_event.dart';
part 'get_all_quotes_state.dart';

class GetAllQuotesBloc extends Bloc<GetAllQuotesEvent, GetAllQuotesState> {
  late final ApiService service;
  GetAllQuotesBloc(this.service) : super(GetAllQuotesInitial()) {
    on<GetAllQuotesInfo>(_onGetAllQuotesInfo);
  }

  Future <void> _onGetAllQuotesInfo(GetAllQuotesInfo event, Emitter<GetAllQuotesState> emit) async {

    try{
      emit(const GetAllQuotesLoading());

      final List<GetAllQuotes?> quote = await service.getAllQuotes();

      emit (GetAllQuotesSuccess(quote));

    }catch(e){
      debugPrint(e.toString());
      emit(GetAllQuotesFail(e.toString()));
    }
  }
}
