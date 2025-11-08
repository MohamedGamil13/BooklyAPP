import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/srearch_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repo) : super(SearchInitial());
  final SrearchRepoImpl repo;
  Future<void> searchBooks(String category) async {
    emit(Searchloading());
    try {
      final res = await repo.getBookByCategory(category);
      res.fold(
        (failure) => emit(SearchFailure(errMessage: failure.errorMassege)),

        (books) => emit(SearchSuccess(books: books)),
      );
    } catch (e) {
      emit(SearchFailure(errMessage: e.toString()));
    }
  }
}
