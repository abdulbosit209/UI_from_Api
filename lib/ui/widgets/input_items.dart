import 'package:custom_ui/models/input_model.dart';
import 'package:flutter/material.dart';

class UniversalInputView extends StatelessWidget {
  const UniversalInputView({Key? key, required this.inputModel})
      : super(key: key);

  final InputModel inputModel;

  @override
  Widget build(BuildContext context) {
    switch (inputModel.type) {
      case "container":
        {
          return Container(
            height: inputModel.height,
            color: HexColor(inputModel.color),
            width: inputModel.width,
            child: Center(child: Text(inputModel.title, style: TextStyle(color: Colors.white))),
          );
        }
      case "column":
        {
          return Container(
            height: inputModel.height,
            color: HexColor(inputModel.color),
            width: inputModel.width,
            child: Column(
               children: [
                  Center(child: Text(inputModel.title, style: TextStyle(color: Colors.white)),)
               ],
                ),
          );
        }
      case "raw":
        {
          return Container(
            height: inputModel.height,
            width: inputModel.width,
            color: HexColor(inputModel.color),
            child: Row(
              children: [
                Center(child: Text(inputModel.title, style: TextStyle(color: Colors.white)),)
              ],
            ),
          );
        }
      case "sizedbox":
        {
          return Container(
            color: HexColor(inputModel.color),
            child: SizedBox(
              height: inputModel.height,
              width: inputModel.width,
              child: Center(child: Text(inputModel.title, style: TextStyle(color: Colors.white),),),
            ),
          );
        }
      default:
        return const Text("No Input found");
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}