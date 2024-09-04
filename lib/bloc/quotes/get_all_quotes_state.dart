part of 'get_all_quotes_bloc.dart';

abstract class GetAllQuotesState extends Equatable {
  const GetAllQuotesState();
  @override
  List<Object> get props => [];
}

class GetAllQuotesInitial extends GetAllQuotesState {}

class GetAllQuotesLoading extends GetAllQuotesState{
  const GetAllQuotesLoading():super();
}

class GetAllQuotesSuccess extends GetAllQuotesState{
  final List<GetAllQuotes?> quotes;

  const GetAllQuotesSuccess(this.quotes):super();

  @override
  List<Object> get props => [quotes];
}

class GetAllQuotesFail extends GetAllQuotesState{
  final dynamic error;

  const GetAllQuotesFail(this.error):super();

  @override
  List<Object> get props => [error];
}