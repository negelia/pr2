class CustomerEntity {
  late int id;
  final String account;
  final String surname;
  final String name;
  final String middle;

  CustomerEntity(
      {required this.account,
      required this.surname,
      required this.name,
      required this.middle});
}
