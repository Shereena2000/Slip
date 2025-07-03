import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_state.freezed.dart';

@freezed
class SalesState with _$SalesState {
  const factory SalesState.initial() = _Initial;
  const factory SalesState.loading() = _Loading;
  const factory SalesState.success(List<dynamic> salesData) = _Success;
  const factory SalesState.error(String message) = _Error;
}