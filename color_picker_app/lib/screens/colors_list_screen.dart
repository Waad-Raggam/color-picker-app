import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/blocs/colors_list_bloc.dart';
import 'package:color_picker_app/blocs/colors_list_events.dart';
import 'package:color_picker_app/blocs/colors_list_states.dart';
import 'package:color_picker_app/utils/color_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsListScreen extends StatelessWidget {
  ColorBlindnessType typeSelected = ColorBlindnessType.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors List'),
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
