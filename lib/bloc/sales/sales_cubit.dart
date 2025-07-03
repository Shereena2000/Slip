import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slip/services/api_service.dart';
import 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  SalesCubit() : super(const SalesState.initial());

  Future<void> loadSales() async {
    emit(const SalesState.loading());

    try {
      final result = await ApiService.getSales();

      if (result['success']) {
        // Wrap the API response in a list to match expected structure
        final salesData = [result];
        emit(SalesState.success(salesData));
      } else {
        emit(SalesState.error(result['error']));
      }
    } catch (e) {
      emit(SalesState.error('Failed to load sales: $e'));
    }
  }

  void reset() {
    emit(const SalesState.initial());
  }}