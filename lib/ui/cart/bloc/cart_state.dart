part of 'cart_bloc.dart';

sealed class CartState {
  const CartState();
}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartResponse cartResponse;

  const CartSuccess(this.cartResponse);
}

class CartError extends CartState {
  final AppException exception;

  const CartError(this.exception);
}

class CartAuthRequired extends CartState {}

class CartEmpty extends CartState {}
