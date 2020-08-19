part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionRefresh extends TransactionState {}

class TransactionAddLoadingState extends TransactionState {}

class TransactionAddStatusState extends TransactionState {
  final String msg;

  TransactionAddStatusState({this.msg});

  @override
  List<Object> get props => [msg];
}
