import 'package:fitness_tracker_app/providers/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enums/workout_type.dart';
import '../widgets/workout_calendar_graph.dart';
import '../widgets/workout_form_dialog.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const SizedBox.shrink(),
              toolbarHeight: 170,
              flexibleSpace: const SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 56.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: WorkoutCalendarGraph(),
                  ),
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(48),
                child: TabBar(
                  tabs: [
                    Tab(text: 'Upper Body'),
                    Tab(text: 'Lower Body'),
                  ],
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                _WorkoutList(type: WorkoutType.upperBody),
                _WorkoutList(type: WorkoutType.lowerBody),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showAddWorkoutDialog(context),
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }

  void _showAddWorkoutDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => WorkoutFormDialog());
  }
}

class _WorkoutList extends StatelessWidget {
  final WorkoutType type;
  const _WorkoutList({required this.type});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final workouts = ref.watch(workoutProvider);
        final workoutCalls = ref.watch(workoutProvider.notifier);
        final filteredWorkouts = workouts
            .where((w) => w.workoutType == type)
            .toList();

        if (filteredWorkouts.isEmpty) {
          return const Center(child: Text('No workouts yet'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: filteredWorkouts.length,
          itemBuilder: (context, index) {
            final list = filteredWorkouts;
            final val = list[index];
            if (filteredWorkouts.isEmpty) {
              return const CircularProgressIndicator();
            }
            return Card(
              child: ListTile(
                enabled: false,
                title: Text(val.name, style: TextStyle(color: Colors.grey)),
                subtitle: Text(
                  val.sets.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: val.isCompleted ? true : false,
                      onChanged: (_) =>
                          workoutCalls.toggleWorkoutStatus(val.id),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => workoutCalls.removeWorkout(val.id),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
