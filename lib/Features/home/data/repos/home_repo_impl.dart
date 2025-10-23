import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

List<BookModel> books = [];

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  final String key = 'AIzaSyCtN5ciqu4PhwN8RPu3lsjF2aQy3fRbusg';

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fecthBestSellerBooks() async {
    try {
      final data = await apiService.get(
        endPoint:
            'volumes?q=programming&filter=free-ebooks&orderBy=newest&maxResults=20&key=$key',
      );

      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMassege: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fecthFeaturedBooks() async {
    try {
      final data = await apiService.get(
        endPoint: 'volumes?q=flowers&orderBy=newest&key=$key',
      );
      List<BookModel> books = [];
      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMassege: e.toString()));
      }
    }
  }
}
