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

class TransactionLoadingState extends TransactionState {}

class TransactionLoadedState extends TransactionState {
  final List<TransactionModel> transaction;

  TransactionLoadedState({this.transaction});

  @override
  List<Object> get props => [transaction];
}

class TransactionFailurState extends TransactionState {
  final msg;

  TransactionFailurState({this.msg});

  @override
  List<Object> get props => [msg];
}
