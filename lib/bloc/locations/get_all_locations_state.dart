part of 'get_all_locations_bloc.dart';

abstract class GetAllLocationsState extends Equatable {
  const GetAllLocationsState();
  @override
  List<Object> get props => [];
}

class GetAllLocationsInitial extends GetAllLocationsState {}

class GetAllLocationsLoading extends GetAllLocationsState{
  const GetAllLocationsLoading():super();
}

class GetAllLocationsSuccess extends GetAllLocationsState{
  final List<GetAllLocations?> locations;

  const  GetAllLocationsSuccess(this.locations):super();

  @override
  List<Object> get props => [locations];

}

class GetAllLocationsFail extends GetAllLocationsState{
  final dynamic error;

  const GetAllLocationsFail(this.error):super();

  @override
  List<Object> get props => [error];
}