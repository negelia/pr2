abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = 'role';
  static const String tableUser = 'user';
  static const String tableSupplier = 'supplier';
  static const String tableWarehouse = 'warehouse';
  static const String tableCompany = 'company';
  static const String tableType = 'type';
  static const String tableVehicle = 'vehicle';
  static const String tableCustomer = 'customer';
  static const String tableCheque = 'cheque';

  static const List<String> tableList = [
    tableRole,
    tableUser,
    tableSupplier,
    tableWarehouse,
    tableCompany,
    tableType,
    tableVehicle,
    tableCustomer,
    tableCheque
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUsers,
    _createTableSupplier,
    _createTableWarehouse,
    _createTableCompany,
    _createTableType,
    _createTableVehicle,
    _createTableCustomer,
    _createTableCheque
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUser" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableSupplier =
      'CREATE TABLE "$tableSupplier" ("id"	INTEGER,"title"	TEXT NOT NULL UNIQUE,"address" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableWarehouse =
      'CREATE TABLE "$tableWarehouse" ("id"	INTEGER,"address"	TEXT NOT NULL UNIQUE,"cell" INTEGER, "id_supplier" INTEGER,FOREIGN KEY("id_supplier") REFERENCES "Supplier"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableCompany =
      'CREATE TABLE "$tableCompany" ("id"	INTEGER,"account"	TEXT NOT NULL UNIQUE,"title" TEXT NOT NULL UNIQUE, "address" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableType =
      'CREATE TABLE "$tableType" ("id"	INTEGER,"title"	TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableVehicle =
      'CREATE TABLE "$tableVehicle" ("id"	INTEGER,"title"	TEXT NOT NULL UNIQUE, "price"	INTEGER, "id_type"	INTEGER, "id_warehouse"	INTEGER, FOREIGN KEY("id_type") REFERENCES "Vehicle"("id") ON DELETE CASCADE, FOREIGN KEY("id_warehouse") REFERENCES "Vehicle"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableCustomer =
      'CREATE TABLE "$tableCustomer" ("id"	INTEGER,"account"	TEXT NOT NULL UNIQUE, "surname" TEXT NOT NULL, "name" TEXT NOT NULL, "middle" TEXT, PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableCheque =
      'CREATE TABLE "$tableCheque" ("id"	INTEGER,"total"	INTEGER, "id_vehicle"	INTEGER, "id_customer" INTEGER, "id_company"	INTEGER, FOREIGN KEY("id_vehicle") REFERENCES "Vehicle"("id") ON DELETE CASCADE, FOREIGN KEY("id_customer") REFERENCES "Customer"("id") ON DELETE CASCADE, FOREIGN KEY("id_company") REFERENCES "Company"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT) )';
}
