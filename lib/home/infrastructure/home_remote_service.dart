import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_floor/common/application/application.dart';
import 'package:test_floor/common/config/app_strings.dart';
import 'package:test_floor/common/domain/response_info_error.dart';
import 'package:test_floor/common/infrastructure/dio_extensions.dart';

import '../../database/note_table.dart';

class HomeRemoteService {
  final Dio dio;
  HomeRemoteService(this.dio);

  Future<Either<ResponseInfoError, NetworkResult<List<Note>>>>
      fetchNotes() async {
    try {
      final response =
          await dio.get('https://663b3f9efee6744a6ea0ea86.mockapi.io/employee');
      var resData = response.data as List<dynamic>;
      if (response.statusCode == AppStrings.statusCode) {
        final data = resData.map((e) => Note.fromJson(e)).toList();
        return right(NetworkResult.result(data));
      } else {
        return left(ResponseInfoError(
            code: response.statusCode.toString(),
            message: response.statusMessage));
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return right(NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response!.statusCode.toString(),
            message: e.response!.statusMessage));
      } else {
        rethrow;
      }
    }
  }

   Future<List<Note>>
      getNotes() async {
    try {
      final response =
          await dio.get('https://663b3f9efee6744a6ea0ea86.mockapi.io/employee');
      var resData = response.data as List<dynamic>;
      if (response.statusCode == AppStrings.statusCode) {
        final data = resData.map((e) => Note.fromJson(e)).toList();
        print('dddd$data');
        return data;
      } else {
        return Future.error('error');
      }
    } on DioException {
      return Future.error('error');
    }
  }

  Future<Either<ResponseInfoError, NetworkResult<String>>> deleteNote(
      String id) async {
    try {
      final response = await dio
          .delete('https://663b3f9efee6744a6ea0ea86.mockapi.io/employee/$id');
      if (response.statusCode == AppStrings.statusCode) {
        return right(NetworkResult.result(response.statusMessage.toString()));
      } else {
        return left(ResponseInfoError(
            code: response.statusCode.toString(),
            message: response.statusMessage));
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return right(NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response!.statusCode.toString(),
            message: e.response!.statusMessage));
      } else {
        rethrow;
      }
    }
  }
  Future<Either<ResponseInfoError, NetworkResult<String>>> updateNote(String id,
      Note note) async {
    final body = {
      "id": id,
      "title": note.title,
      "message": note.message,
      
    };
    try {
      final response = await dio.put('https://663b3f9efee6744a6ea0ea86.mockapi.io/employee/$id', data: body);
      if (response.statusCode == AppStrings.statusCode) {
        return right(NetworkResult.result(response.statusMessage.toString()));
      } else {
        return left(ResponseInfoError(
          code: response.statusCode.toString(),
          message: response.statusMessage,
        ));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return right(NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response?.statusCode.toString(),
            message: e.response?.statusMessage));
      } else {
        rethrow;
      }
    }
  }

}
