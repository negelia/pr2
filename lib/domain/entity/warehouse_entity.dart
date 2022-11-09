import 'package:pr2/domain/entity/supplier_entity.dart';

class WarehouseEntity {
  late int id;
  final String address;
  final int cell; //количество ячеек склада
  final SupplierEntity idSupplier;

  WarehouseEntity(
      {this.id = 0,
      required this.address,
      required this.cell,
      required this.idSupplier});
}
