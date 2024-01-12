import 'package:color_picker_app/blocs/colors_list_bloc.dart';
import 'package:color_picker_app/blocs/colors_list_events.dart';
import 'package:color_picker_app/screens/colors_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colors App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF343540),
      ),
      home: BlocProvider(
        create: (context) => ColorsListBloc()..add(LoadColorsListEvent()),
        child: ColorsListScreen(),
      ),
    );
  }
}
