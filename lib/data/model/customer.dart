import 'package:pr2/domain/entity/customer_entity.dart';

class Customer extends CustomerEntity {
  Customer(
      {required super.account,
      required super.surname,
      required super.name,
      required super.middle});

  Map<String, dynamic> toMap() {
    return {
      'account': account,
      'surname': surname,
      'name': name,
      'middle': middle
    };
  }

  factory Customer.toFromMap(Map<String, dynamic> json) {
    return Customer(
      account: json['account'],
      surname: json['surname'],
      name: json['name'],
      middle: json['middle'],
    );
  }
}
