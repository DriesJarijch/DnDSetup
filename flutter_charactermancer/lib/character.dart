import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character {
  Character({required this.name, required this.level, required this.stats, this.dndClass});

  @HiveField(0)
  String name;

  @HiveField(1)
  int level;

  @HiveField(2)
  List<int> stats;

  @HiveField(3)
  List? dndClass;
}


//dart run build_runner build
