import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:karyasmk/models/models.dart';
import 'package:karyasmk/repositories/repository.dart';

part 'school_event.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  final ProductListRepo _schoolProductRepo;

  SchoolBloc(this._schoolProductRepo) : super(SchoolInitial());

  @override
  Stream<SchoolState> mapEventToState(
    SchoolEvent event,
  ) async* {
    if (event is FetchSchoolProductEvent) {
      yield SchoolLoadingState();

      try {
        final List<ProductListModel> schoolProductList =
            await _schoolProductRepo.getProductList();
        yield SchoolStateLoaded(schoolProduct: schoolProductList);
      } catch (e) {
        yield SchoolStateFailure(msg: e);
      }
    }
  }
}
