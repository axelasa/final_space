part of 'get_all_locations_bloc.dart';

abstract class GetAllLocationsEvent extends Equatable {
  const GetAllLocationsEvent();
  @override
  List<Object> get props => [];
}

class GetAllLocationsInfo extends GetAllLocationsEvent{
  const GetAllLocationsInfo():super();
}