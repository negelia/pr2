import 'package:pr2/domain/entity/warehouse_entity.dart';
import 'package:pr2/domain/entity/type_entity.dart';

class VehicleEntity {
  late int id;
  final String title;
  final int price;
  final WarehouseEntity idWarehouse;
  final TypeEnum idType;

  VehicleEntity(
      {this.id = 0,
      required this.title,
      required this.price,
      required this.idType,
      required this.idWarehouse});
}
