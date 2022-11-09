import 'package:pr2/data/model/company.dart';
import 'package:pr2/data/model/customer.dart';
import 'package:pr2/data/model/vehicle.dart';
import 'package:pr2/domain/entity/cheque_entity.dart';
import 'package:pr2/domain/entity/company_entity.dart';

class Cheque extends ChequeEntity {
  Cheque(
      {super.id = 0,
      required super.total,
      required super.idVehicle,
      required super.idCustomer,
      required super.idCompany});

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'id_vehicle': idVehicle.id,
      'id_customer': idCustomer.id,
      'id_company': idCompany.id
    };
  }

  factory Cheque.toFromMap(Map<String, dynamic> json) {
    return Cheque(
      id: json['id'] as int,
      total: json['total'],
      idVehicle: Vehicle.toFromMap(json),
      idCustomer: Customer.toFromMap(json),
      idCompany: CompanyEnum.values
          .firstWhere((element) => element.id == (json['id_company'] as int)),
    );
  }
}
