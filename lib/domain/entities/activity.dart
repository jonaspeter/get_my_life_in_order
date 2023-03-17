import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required String name,
}) = _Activity;
}