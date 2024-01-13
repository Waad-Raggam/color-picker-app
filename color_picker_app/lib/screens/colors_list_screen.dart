import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/blocs/colors_list_bloc.dart';
import 'package:color_picker_app/blocs/colors_list_events.dart';
import 'package:color_picker_app/blocs/colors_list_states.dart';
import 'package:color_picker_app/utils/color_card.dart';
import 'package:color_picker_app/utils/color_circle.dart';
import 'package:color_picker_app/utils/color_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsListScreen extends StatefulWidget {
  @override
  _ColorsListScreenState createState() => _ColorsListScreenState();
}

class _ColorsListScreenState extends State<ColorsListScreen> {
  bool showHexValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF393441),
        title: Builder(
          builder: (appBarContext) {
            return BlocBuilder<ColorsListBloc, ColorsListState>(
              builder: (context, state) {
                final typeSelected = (state is ColorsListLoaded)
                    ? state.colors.first.typeSelected
                    : ColorBlindnessType.none;
                return ColorBlindType(typeSelected: typeSelected);
              },
            );
          },
        ),
        actions: [
          Switch(
            activeColor: Colors.green,
            inactiveThumbColor: Colors.grey,
            value: showHexValue,
            onChanged: (value) {
              context.read<ColorsListBloc>().add(ToggleColorInfoEvent(value));
              setState(() {
                showHexValue = value;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.visibility_off_outlined),
            onPressed: () {
              context.read<ColorsListBloc>().add(ChangeColorBlindnessEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<ColorsListBloc, ColorsListState>(
        builder: (context, state) {
          if (state is ColorsListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ColorsListLoaded) {
            return Column(
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.colors.length,
                    itemBuilder: (context, index) {
                      final color = state.colors[index];
                      return ColorCircle(
                        color: color,
                        showHexValue: showHexValue,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.colors.length,
                    itemBuilder: (context, index) {
                      final color = state.colors[index];
                      return ColorCard(
                        color: color,
                        showHexValue: showHexValue,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ColorsListErrorState) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
