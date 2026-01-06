import 'package:fitness_tracker_app/enums/workout_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
abstract class Workout with _$Workout{
  const factory Workout({
    required String id,
    required String name,
    required double weight,
    required int reps,
    required int sets,
    required WorkoutType workoutType,
    required bool isCompleted,
    required DateTime createdAt,
    DateTime? completedAt, 
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json); 
}