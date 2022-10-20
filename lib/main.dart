import 'package:custom_ui/cubits/dynamic_views_cubit.dart';
import 'package:custom_ui/repository/repository.dart';
import 'package:custom_ui/ui/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => DynamicViewsCubit(myRepository: MyRepository()),
        child: CustomWidgets(),
      ),
    );
  }
}
