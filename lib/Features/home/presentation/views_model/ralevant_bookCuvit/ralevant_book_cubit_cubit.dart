import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'ralevant_book_cubit_state.dart';

class RalevantBookCubitCubit extends Cubit<RalevantBookCubitState> {
  RalevantBookCubitCubit(this.repo) : super(RalevantBookCubitInitial());
  final HomeRepo repo;
  Future<void> fetchRalevantBooks({required String category}) async {
    emit(RalevantBookCubitLoading());
    var res = await repo.fecthRelaventBooks(category: category);
    res.fold(
      (failure) {
        emit(RalevantBookCubitFailure(failure.errorMassege));
      },
      (books) {
        emit(RalevantBookCubitSuccess(books));
      },
    );
  }
}
