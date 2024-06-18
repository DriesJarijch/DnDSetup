import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character {
  Character({
    required this.name,
    required this.Level
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  int Level;
}