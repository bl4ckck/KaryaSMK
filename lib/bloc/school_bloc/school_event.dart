part of 'school_bloc.dart';

abstract class SchoolEvent extends Equatable {
  const SchoolEvent();

  @override
  List<Object> get props => [];
}

class FetchSchoolProductEvent extends SchoolEvent {}
