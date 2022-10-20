import 'package:bloc/bloc.dart';
import 'package:custom_ui/models/input_model.dart';
import 'package:custom_ui/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'dynamic_views_state.dart';

class DynamicViewsCubit extends Cubit<DynamicViewsState> {
  DynamicViewsCubit({required this.myRepository}) : super(DynamicViewsState(
      status: FormzStatus.pure,
      dynamicFields: []
  ));

  final MyRepository myRepository;

  void fetchDynamicFields()async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try{
      var data = await myRepository.getDynamicFields();
      emit(state.copyWith(status: FormzStatus.submissionSuccess, dynamicFields: data));
    }catch(e){
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      print(e);
    }
  }


}
