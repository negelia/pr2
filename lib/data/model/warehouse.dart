import 'package:pr2/data/model/supplier.dart';
import 'package:pr2/domain/entity/supplier_entity.dart';
import 'package:pr2/domain/entity/warehouse_entity.dart';

class Warehouse extends WarehouseEntity {
  Warehouse(
      {super.id = 0,
      required super.address,
      required super.cell,
      required super.idSupplier});

  Map<String, dynamic> toMap() {
    return {'address': address, 'cell': cell, 'id_supplier': idSupplier.id};
  }

  factory Warehouse.toFromMap(Map<String, dynamic> json) {
    return Warehouse(
        id: json['id'] as int,
        address: json['address'],
        cell: json['cell'],
        idSupplier: Supplier.toFromMap(json));
  }
}
