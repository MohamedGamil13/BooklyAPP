import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.repo) : super(FeaturedBooksInitial());
  final HomeRepo repo;

  List<BookModel> allBooks = [];
  int currentPage = 0;
  bool isLoadingMore = false;

  Future<void> fetchFeaturedBooks() async {
    if (isLoadingMore) return;

    try {
      if (currentPage == 0) emit(FeaturedBooksLoading());
      isLoadingMore = true;

      var res = await repo.fecthFeaturedBooks(currentPage);

      res.fold(
        (failure) {
          emit(FeaturedBooksFailure(errorMassege: failure.errorMassege));
        },
        (books) {
          allBooks.addAll(books);
          emit(FeaturedBooksSucess(books: List.from(allBooks)));
          currentPage++;
        },
      );
    } finally {
      isLoadingMore = false;
    }
  }
}
