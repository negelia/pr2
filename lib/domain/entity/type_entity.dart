class TypeEntity {
  late int id;
  final String title;

  TypeEntity({required this.title});
}

enum TypeEnum {
  sport(id: 1, type: 'спортивный'),
  mountain(id: 2, type: 'горный'),
  techno(id: 3, type: 'электрический'),
  child(id: 4, type: 'детский');

  const TypeEnum({
    required this.id,
    required this.type,
  });

  final String type;
  final int id;
}
