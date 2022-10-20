part of 'dynamic_views_cubit.dart';

class DynamicViewsState extends Equatable {
  const DynamicViewsState(
      {required this.status,
      required this.dynamicFields});

  final FormzStatus status;
  final List<InputModel> dynamicFields;

  DynamicViewsState copyWith({
    FormzStatus? status,
    List<InputModel>? dynamicFields,
  }) => DynamicViewsState(
        status: status ?? this.status,
        dynamicFields: dynamicFields ?? this.dynamicFields,
  );

  @override
  List<Object?> get props => [
    status,
    dynamicFields
  ];
}
