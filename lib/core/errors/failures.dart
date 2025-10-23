import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMassege;

  const Failure({required this.errorMassege});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMassege});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMassege: 'ConnectionTimeout with Apiserver');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMassege: 'Send ConnectionTimeout with Apiserver',
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMassege: 'Receive ConnectionTimeout with Apiserver',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMassege: 'ConnectionTimeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMassege: 'Cancel');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMassege: 'connection error');
      case DioExceptionType.unknown:
        return ServerFailure(errorMassege: 'NO internet connection');
    }
  }
  factory ServerFailure.fromResponse(int statuescode, dynamic response) {
    if (statuescode == 400 || statuescode == 401 || statuescode == 403) {
      return ServerFailure(errorMassege: response['error']['message']);
    } else if (statuescode == 404) {
      return ServerFailure(
        errorMassege: 'Your request is not found plase try again',
      );
    } else if (statuescode == 500) {
      return ServerFailure(errorMassege: 'Internal Server Error');
    } else {
      return ServerFailure(errorMassege: 'there is an error');
    }
  }
}
