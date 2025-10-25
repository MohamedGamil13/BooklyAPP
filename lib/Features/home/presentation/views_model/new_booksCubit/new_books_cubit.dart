import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'new_books_state.dart';

class NewBooksCubit extends Cubit<NewBooksState> {
  NewBooksCubit(this.repo) : super(NewBooksInitial());
  final HomeRepo repo;
  Future<void> fetchNewBooks([page = 0]) async {
    emit(NewBooksLoading());
    var res = await repo.fecthNewstBooks(page);
    res.fold(
      (failure) {
        emit(NewBooksFailure(errorMassege: failure.errorMassege));
      },
      (books) {
        emit(NewBooksSucess(books: books));
      },
    );
  }
}
