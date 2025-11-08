import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/srearch_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class SrearchRepoImpl implements SreachRepo {
  SrearchRepoImpl({required this.apiService});
  final ApiService apiService;
  final String key = 'AIzaSyCtN5ciqu4PhwN8RPu3lsjF2aQy3fRbusg';
  @override
  Future<Either<Failure, List<BookModel>>> getBookByCategory(
    String category,
  ) async {
    try {
      final data = await apiService.get(
        endPoint: 'volumes?q=$category&maxResults=40&key=$key',
      );

      if (data['items'] == null) return right([]);

      final books = (data['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();

      return right(books);
    } catch (e) {
      return left(ServerFailure(errorMassege: e.toString()));
    }
  }
}
