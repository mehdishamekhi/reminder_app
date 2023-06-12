import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  bool isdone;
  @HiveField(3)
  DateTime time;
  Task({
    required this.title,
    required this.subtitle,
    this.isdone = false,
    required this.time,
  });
}
