import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getSqliteDb() async {
  const dbFileName = 'pocket_money_record_book.db';
  final dbDir = await getApplicationSupportDirectory();
  final path = join(dbDir.path, dbFileName);
  return openDatabase(path);
}
