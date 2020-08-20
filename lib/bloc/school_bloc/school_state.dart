part of 'school_bloc.dart';

abstract class SchoolState extends Equatable {
  const SchoolState();

  @override
  List<Object> get props => [];
}

class SchoolInitial extends SchoolState {}

class SchoolLoadingState extends SchoolState {}

class SchoolStateLoaded extends SchoolState {
  final List<ProductListModel> schoolProduct;

  SchoolStateLoaded({this.schoolProduct});

  @override
  List<Object> get props => [schoolProduct];
}

class SchoolStateFailure extends SchoolState {
  final String msg;

  SchoolStateFailure({this.msg});

  @override
  List<Object> get props => [msg];
}
