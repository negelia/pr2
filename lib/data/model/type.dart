import 'package:pr2/domain/entity/type_entity.dart';

class Type extends TypeEntity {
  Type({required super.title});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Type.toFromMap(Map<String, dynamic> json) {
    return Type(title: json['title']);
  }
}
