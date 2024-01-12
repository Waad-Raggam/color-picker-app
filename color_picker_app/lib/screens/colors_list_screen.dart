import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/blocs/colors_list_bloc.dart';
import 'package:color_picker_app/blocs/colors_list_events.dart';
import 'package:color_picker_app/blocs/colors_list_states.dart';
import 'package:color_picker_app/utils/color_card.dart';
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
                String title;
                switch (typeSelected) {
                  case ColorBlindnessType.none:
                    title = 'Colors List (Normal)';
                    break;
                  case ColorBlindnessType.protanomaly:
                    title = 'Colors List (Protanomaly)';
                    break;
                  case ColorBlindnessType.deuteranomaly:
                    title = 'Colors List (Deuteranomaly)';
                    break;
                  case ColorBlindnessType.tritanomaly:
                    title = 'Colors List (Tritanomaly)';
                    break;
                  case ColorBlindnessType.protanopia:
                    title = 'Colors List (Protanopia)';
                    break;
                  case ColorBlindnessType.deuteranopia:
                    title = 'Colors List (Deuteranopia)';
                    break;
                  case ColorBlindnessType.tritanopia:
                    title = 'Colors List (Tritanopia)';
                    break;
                  case ColorBlindnessType.achromatopsia:
                    title = 'Colors List (Achromatopsia)';
                    break;
                  case ColorBlindnessType.achromatomaly:
                    title = 'Colors List (Achromatomaly)';
                    break;

                  default:
                    title = 'Colors List';
                }
                return Text(title);
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
            return ListView.builder(
              itemCount: state.colors.length,
              itemBuilder: (context, index) {
                final color = state.colors[index];
                return ColorCard(color: color);
              },
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
