import 'package:pr2/domain/entity/company_entity.dart';

class Company extends CompanyEntity {
  Company(
      {required super.account, required super.title, required super.address});

  Map<String, dynamic> toMap() {
    return {'account': account, 'title': title, 'address': address};
  }

  factory Company.toFromMap(Map<String, dynamic> json) {
    return Company(
        account: json['account'],
        title: json['title'],
        address: json['address']);
  }
}
