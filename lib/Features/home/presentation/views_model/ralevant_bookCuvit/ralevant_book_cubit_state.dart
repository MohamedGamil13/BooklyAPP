part of 'ralevant_book_cubit_cubit.dart';

sealed class RalevantBookCubitState extends Equatable {
  const RalevantBookCubitState();

  @override
  List<Object> get props => [];
}

final class RalevantBookCubitInitial extends RalevantBookCubitState {}

final class RalevantBookCubitLoading extends RalevantBookCubitState {}

final class RalevantBookCubitSuccess extends RalevantBookCubitState {
  final List<BookModel> books;
  const RalevantBookCubitSuccess(this.books);
}

final class RalevantBookCubitFailure extends RalevantBookCubitState {
  final String errorMassege;
  const RalevantBookCubitFailure(this.errorMassege);
}
