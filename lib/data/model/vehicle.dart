import 'package:pr2/data/model/warehouse.dart';
import 'package:pr2/domain/entity/type_entity.dart';
import 'package:pr2/domain/entity/vehicle_entity.dart';

class Vehicle extends VehicleEntity {
  Vehicle(
      {super.id = 0,
      required super.title,
      required super.price,
      required super.idType,
      required super.idWarehouse});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'id_type': idType.id,
      'id_warehouse': idWarehouse.id
    };
  }

  factory Vehicle.toFromMap(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'] as int,
      title: json['title'],
      price: json['price'],
      idType: TypeEnum.values
          .firstWhere((element) => element.id == (json['id_type'] as int)),
      idWarehouse: Warehouse.toFromMap(json),
    );
  }
}
