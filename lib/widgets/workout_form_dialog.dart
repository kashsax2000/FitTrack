import 'package:fitness_tracker_app/enums/workout_type.dart';
import 'package:fitness_tracker_app/providers/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutFormDialog extends StatelessWidget {
  const WorkoutFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    late final TextEditingController nameController;
    late final TextEditingController weightController;
    late final TextEditingController repsController;
    late final TextEditingController setsController;
    WorkoutType selectedType = WorkoutType.upperBody;

    nameController = TextEditingController();
    weightController = TextEditingController();
    repsController = TextEditingController();
    setsController = TextEditingController();

    // void submitForm() {
    //   ref
    //       .read(workoutProvider.notifier)
    //       .addWorkout(
    //         nameController.text,
    //         double.tryParse(weightController.text) ?? 0.0,
    //         int.tryParse(repsController.text) ?? 0,
    //         int.tryParse(setsController.text) ?? 0,
    //         selectedType,
    //       );
    // }

    return Consumer(
      builder: (context, ref, child) {
        final workouts = ref.watch(workoutProvider.notifier);
        return AlertDialog(
          title: const Text('Add Workout'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter a name' : null,
                ),
                TextFormField(
                  controller: weightController,
                  decoration: const InputDecoration(labelText: 'Weight (kg)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter weight' : null,
                ),
                TextFormField(
                  controller: repsController,
                  decoration: const InputDecoration(labelText: 'Reps'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter reps' : null,
                ),
                TextFormField(
                  controller: setsController,
                  decoration: const InputDecoration(labelText: 'Sets'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter sets' : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<WorkoutType>(
                  value: selectedType,
                  onChanged: (value) {
                    if (value != null) {
                      selectedType = value;
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: WorkoutType.upperBody,
                      child: Text('Upper Body'),
                    ),
                    DropdownMenuItem(
                      value: WorkoutType.lowerBody,
                      child: Text('Lower Body'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                workouts.addWorkout(
                  nameController.text,
                  double.tryParse(weightController.text) ?? 0.0,
                  int.tryParse(repsController.text) ?? 0,
                  int.tryParse(setsController.text) ?? 0,
                  selectedType,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
