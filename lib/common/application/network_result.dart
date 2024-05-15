import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_result.freezed.dart';

@freezed
class NetworkResult<T> with _$NetworkResult {
  NetworkResult._();
   factory NetworkResult.noConnection() = _NoConnection<T>;
   factory NetworkResult.result(T data)= _Result<T>;
}