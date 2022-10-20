import 'package:custom_ui/models/input_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../cubits/dynamic_views_cubit.dart';
import 'widgets/input_items.dart';

class CustomWidgets extends StatelessWidget {
  const CustomWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic views"),
      ),
      body: BlocBuilder<DynamicViewsCubit, DynamicViewsState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionFailure) {
            return const Center(child: Text("Error"));
          }
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == FormzStatus.submissionSuccess) {

            List<InputModel> commonContainer = state.dynamicFields
                .where((element) => element.group == "COMMON")
                .toList();

            List<InputModel> receiversContainer = state.dynamicFields
                .where((element) => element.group == "GROUPED")
                .toList();
            print(receiversContainer.length);
            print(commonContainer.length);

            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                getMyCustomContainer(
                  Column(
                    children: [
                       Text("COMMON info"),
                      ...List.generate(
                        commonContainer.length,
                            (index) => UniversalInputView(
                          inputModel: commonContainer[index],
                        ),
                      )
                    ],
                  ),
                ),
                getMyCustomContainer(
                  Column(
                    children: [
                       Text("RECEIVER info"),
                      ...List.generate(
                        receiversContainer.length,
                            (index) => UniversalInputView(
                          inputModel: receiversContainer[index],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          BlocProvider.of<DynamicViewsCubit>(context).fetchDynamicFields();
        },
      ),
    );

  }

  Widget getMyCustomContainer(Widget widget) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                spreadRadius: 6,
                offset: const Offset(2, 4),
                color: Colors.grey.withOpacity(0.3))
          ]),
      child: widget,
    );
  }
}
