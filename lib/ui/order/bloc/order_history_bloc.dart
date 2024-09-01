import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/common/exceptions.dart';
import 'package:flutter_application_2/data/order.dart';
import 'package:flutter_application_2/data/repo/order_repository.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final IOrderRepository repository;
  OrderHistoryBloc(this.repository) : super(OrderHistoryLoading()) {
    on<OrderHistoryEvent>((event, emit) async {
      if (event is OrderHistoryStarted) {
        try {
          emit(OrderHistoryLoading());
          final orders = await repository.getOrder();
          emit(OrderHistorySuccess(orders));
        } catch (e) {
          emit(OrderHistroryError(AppException()));
        }
      }
    });
  }
}
