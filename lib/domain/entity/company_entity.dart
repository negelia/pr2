import 'package:flutter/cupertino.dart';

class CompanyEntity {
  late int id;
  final String account;
  final String title;
  final String address;

  CompanyEntity(
      {this.id = 0,
      required this.account,
      required this.title,
      required this.address});
}

enum CompanyEnum {
  company(
      id: 1,
      account: '123-456-123-456',
      title: 'Банк ПСБ',
      address: 'г.Москва, ул.1-я Ватутинская, д.7');

  const CompanyEnum({
    required this.id,
    required this.account,
    required this.title,
    required this.address,
  });

  final String address;
  final String title;
  final String account;
  final int id;
}
