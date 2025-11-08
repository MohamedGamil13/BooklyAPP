import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.repo) : super(FeaturedBooksInitial());

  final HomeRepo repo;

  final List<BookModel> allBooks = [];
  int currentPage = 0;
  bool isLoadingMore = false;

  Future<void> fetchFeaturedBooks() async {
    if (isLoadingMore) return; // حماية من التكرار

    try {
      if (currentPage == 0) {
        emit(FeaturedBooksLoading());
      }

      isLoadingMore = true;

      // استدعاء الكتب من الـ repo
      final result = await repo.fecthFeaturedBooks(currentPage);

      result.fold(
        (failure) {
          emit(FeaturedBooksFailure(errorMessage: failure.errorMassege));
        },
        (books) {
          allBooks.addAll(books);
          currentPage++;

          // نبعث نسخة غير قابلة للتعديل
          emit(FeaturedBooksSuccess(books: List.unmodifiable(allBooks)));
        },
      );
    } finally {
      isLoadingMore = false;
    }
  }
}
