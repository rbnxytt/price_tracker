import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 1)
class Database extends HiveObject {
  @HiveField(0)
  DateTime? date;

  @HiveField(1)
  double? gzPrice;

  @HiveField(2)
  double? szPrice;

  @HiveField(3)
  double? hzPrice;

  @HiveField(4)
  double? mmPrice;

  @HiveField(5)
  double? fsPrice;

  Database(
      {this.date,
      this.gzPrice,
      this.szPrice,
      this.hzPrice,
      this.mmPrice,
      this.fsPrice});
}
