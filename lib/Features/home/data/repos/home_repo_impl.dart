import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  final String key = 'AIzaSyCtN5ciqu4PhwN8RPu3lsjF2aQy3fRbusg';

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fecthNewstBooks([
    int page = 0,
  ]) async {
    final int startIndex = page * 40;
    try {
      final data = await apiService.get(
        endPoint:
            'volumes?q=sexual+education+health&orderBy=relevance&startIndex=$startIndex&maxResults=40&key=$key',
      );

      if (data['items'] == null) return right([]);

      final books = (data['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();

      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMassege: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fecthFeaturedBooks([
    int page = 0,
  ]) async {
    final int startIndex = page * 40;
    try {
      final data = await apiService.get(
        endPoint:
            'volumes?q=movies&orderBy=relevance&startIndex=$startIndex&maxResults=40&key=$key',
      );

      if (data['items'] == null) return right([]);

      final books = (data['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();

      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMassege: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fecthRelaventBooks({
    int page = 0,
    required String category,
  }) async {
    final int startIndex = page * 40;
    try {
      final data = await apiService.get(
        endPoint:
            'volumes?q=$category&orderBy=relevance&startIndex=$startIndex&maxResults=40&key=$key',
      );

      if (data['items'] == null) return right([]);

      final books = (data['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();

      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMassege: e.toString()));
    }
  }
}
