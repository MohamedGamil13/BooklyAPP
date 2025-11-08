part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class Searchloading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookModel> books;

  const SearchSuccess({required this.books});

  @override
  List<Object> get props => [books];
}

final class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
