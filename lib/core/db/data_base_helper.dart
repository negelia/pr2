import 'dart:io';

import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/data/model/cheque.dart';
import 'package:pr2/data/model/company.dart';
import 'package:pr2/data/model/customer.dart';
import 'package:pr2/data/model/role.dart';
import 'package:pr2/data/model/supplier.dart';
import 'package:pr2/data/model/user.dart';
import 'package:pr2/data/model/vehicle.dart';
import 'package:pr2/data/model/warehouse.dart';
import 'package:pr2/domain/entity/company_entity.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/entity/type_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'test.db'); //combine two strokes

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: ((db, oldVersion, newVersion) => onUpdateTable(db)),
        onCreate: (db, version) => onCreateTable(db),
      );
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');
    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    await onCreateTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
    await onInitTable(db);
  }

  Future<void> onDropDataBase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    } else {
      deleteDatabase(_pathDB);
    }
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }

      db.insert(
          DataBaseRequest.tableUser,
          User(login: 'admin', idRole: RoleEnum.admin, password: 'admin123')
              .toMap());

      db.insert(
          DataBaseRequest.tableCustomer,
          Customer(
                  account: '123-456-123-456',
                  surname: 'kruglova',
                  name: 'ira',
                  middle: 'ivanovna')
              .toMap());

      db.insert(
          DataBaseRequest.tableSupplier,
          Supplier(title: 'BIKES CO', address: 'г. Москва, ул. Маршруток, д.8')
              .toMap());

      db.insert(
          DataBaseRequest.tableWarehouse,
          Warehouse(
                  address: 'г.Москва, ул.Победы, д.1',
                  cell: 12,
                  idSupplier: Supplier(
                      title: 'BIKES CO',
                      address: 'г. Москва, ул. Маршруток, д.8'))
              .toMap());

      db.insert(
          DataBaseRequest.tableVehicle,
          Vehicle(
                  title: 'super-puper bike',
                  price: 30000,
                  idType: TypeEnum.sport,
                  idWarehouse: Warehouse(
                      address: 'г.Москва, ул.Победы, д.1',
                      cell: 12,
                      idSupplier: Supplier(
                          title: 'BIKES CO',
                          address: 'г. Москва, ул. Маршруток, д.8')))
              .toMap());

      db.insert(
          DataBaseRequest.tableCheque,
          Cheque(
                  total: '30500 руб',
                  idVehicle: Vehicle(
                      title: 'super-puper bike',
                      price: 30000,
                      idType: TypeEnum.sport,
                      idWarehouse: Warehouse(
                          address: 'г.Москва, ул.Победы, д.1',
                          cell: 12,
                          idSupplier: Supplier(
                              title: 'BIKES CO',
                              address: 'г. Москва, ул. Маршруток, д.8'))),
                  idCustomer: Customer(
                      account: '123-456-123-456',
                      surname: 'kruglova',
                      name: 'ira',
                      middle: 'ivanovna'),
                  idCompany: CompanyEnum.company)
              .toMap());
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }
}
