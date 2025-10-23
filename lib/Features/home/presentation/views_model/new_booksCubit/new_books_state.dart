part of 'new_books_cubit.dart';

sealed class NewBooksState extends Equatable {
  const NewBooksState();

  @override
  List<Object> get props => [];
}

final class NewBooksInitial extends NewBooksState {}

final class NewBooksLoading extends NewBooksState {}

final class NewBooksFailure extends NewBooksState {
  final String errorMassege;

  const NewBooksFailure({required this.errorMassege});
}

final class NewBooksSucess extends NewBooksState {
  final List<BookModel> books;

  const NewBooksSucess({required this.books});
}
