part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSucess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSucess({required this.books});
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMassege;

  const FeaturedBooksFailure({required this.errorMassege});
}
