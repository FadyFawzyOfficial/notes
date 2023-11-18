import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final int color;

  Note({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });

  @override
  String toString() =>
      'Note(title: $title, description: $description, date: $date, color: $color)';
}
