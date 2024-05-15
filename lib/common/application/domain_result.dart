import 'package:freezed_annotation/freezed_annotation.dart';
part 'domain_result.freezed.dart';
@freezed
class DomainResult<T> with _$DomainResult {
   factory DomainResult.noConnection() = _NoInternet<T>;
   factory DomainResult.result(T data)= _Result<T>;
}