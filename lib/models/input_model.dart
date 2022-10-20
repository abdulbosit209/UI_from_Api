import 'package:json_annotation/json_annotation.dart';

part 'input_model.g.dart';

@JsonSerializable()
class InputModel {

  @JsonKey(defaultValue: "", name: "title")
  String title;

  @JsonKey(defaultValue: 0, name: "sort")
  int sort;

  @JsonKey(defaultValue: "", name: "group")
  String group;

  @JsonKey(defaultValue: 0.0, name: "width")
  double width;

  @JsonKey(defaultValue: 0.0, name: "height")
  double height;

  @JsonKey(defaultValue: "", name: "color")
  String color;

  @JsonKey(defaultValue: "", name: "type")
  String type;


  InputModel({
    required this.type,
    required this.group,
    required this.sort,
    required this.height,
    required this.width,
    required this.title,
    required this.color,

  });

  factory InputModel.fromJson(Map<String, dynamic> json) => _$InputModelFromJson(json);
  Map<String, dynamic> toJson() => _$InputModelToJson(this);
}
