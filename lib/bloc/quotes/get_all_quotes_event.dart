part of 'get_all_quotes_bloc.dart';

abstract class GetAllQuotesEvent extends Equatable {
  const GetAllQuotesEvent();
  @override
  List<Object> get props => [];
}

class GetAllQuotesInfo extends GetAllQuotesEvent{
  final int? id;
  const GetAllQuotesInfo({this.id}):super();


}