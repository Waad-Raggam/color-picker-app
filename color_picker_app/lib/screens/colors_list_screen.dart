import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/blocs/colors_list_bloc.dart';
import 'package:color_picker_app/blocs/colors_list_events.dart';
import 'package:color_picker_app/blocs/colors_list_states.dart';
import 'package:color_picker_app/utils/color_card.dart';
import 'package:color_picker_app/utils/color_circle.dart';
import 'package:color_picker_app/utils/color_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (appBarContext) {
            return BlocBuilder<ColorsListBloc, ColorsListState>(
              builder: (context, state) {
                // Retrieve the current typeSelected
                final typeSelected = (state is ColorsListLoaded)
                    ? state.colors.first.typeSelected
                    : ColorBlindnessType.none;

                // Build the title based on typeSelected
                return ColorBlindType(typeSelected: typeSelected);
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () {
              // Dispatch the ChangeColorBlindnessEvent to update the color scheme
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
                // Row of circles
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.colors.length,
                    itemBuilder: (context, index) {
                      final color = state.colors[index];
                      return ColorCircle(color: color);
                    },
                  ),
                ),
                // List of cards
                Expanded(
                  child: ListView.builder(
                    itemCount: state.colors.length,
                    itemBuilder: (context, index) {
                      final color = state.colors[index];
                      return ColorCard(color: color);
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
