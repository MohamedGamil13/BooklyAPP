import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.repo) : super(FeaturedBooksInitial());
  final HomeRepo repo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var res = await repo.fecthFeaturedBooks();
    res.fold(
      (failure) {
        emit(FeaturedBooksFailure(errorMassege: failure.errorMassege));
      },
      (books) {
        emit(FeaturedBooksSucess(books: books));
      },
    );
  }
}
