import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character {
  Character({required this.name, required this.level});

  @HiveField(0)
  String name;

  @HiveField(1)
  int level;
}
