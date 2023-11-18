import 'dart:convert';

class Note {
  final String title;
  final String description;
  final DateTime date;
  final int color;

  Note({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      color: map['color'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'color': color,
    };
  }

  @override
  String toString() =>
      'Note(title: $title, description: $description, date: $date, color: $color)';
}
