import 'package:pr2/domain/entity/customer_entity.dart';
import 'package:pr2/domain/entity/company_entity.dart';
import 'package:pr2/domain/entity/vehicle_entity.dart';

class ChequeEntity {
  late int id;
  final String total;
  final VehicleEntity idVehicle;
  final CustomerEntity idCustomer;
  final CompanyEnum idCompany;

  ChequeEntity(
      {this.id = 0,
      required this.total,
      required this.idVehicle,
      required this.idCustomer,
      required this.idCompany});
}
