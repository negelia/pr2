class RoleEntity {
  late int id;
  final String role;

  RoleEntity({required this.role});
}

// enum RoleEnum{admin, user}

enum RoleEnum {
  admin(id: 1, name: 'admin'),
  user(id: 2, name: 'user');

  const RoleEnum({
    required this.id,
    required this.name,
  });

  final String name;
  final int id;
}
