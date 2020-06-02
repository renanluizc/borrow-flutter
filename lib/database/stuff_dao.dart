import 'package:borrowed_flutter/database/app_database.dart';
import 'package:borrowed_flutter/models/stuff.dart';
import 'package:sembast/sembast.dart';

class StuffDao {
  static const String folderName = 'Stuff';
  final _stuffFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  // CRUD
  Future create(Stuff stuff) async {
    stuff.id = await _stuffFolder.add(await _db, stuff.toMap());
    final finder =
        Finder(filter: Filter.equals('description', stuff.description));
    await _stuffFolder.update(await _db, stuff.toMap(), finder: finder);
  }

  Future<List<Stuff>> readAll() async {
    final recordSnapshot = await _stuffFolder.find(await _db);
    return recordSnapshot.map((e) => Stuff.fromMap(e.value)).toList();
  }

  Future update(Stuff stuff) async {
    final finder = Finder(filter: Filter.byKey(stuff.id));
    await _stuffFolder.update(await _db, stuff.toMap(), finder: finder);
  }

  Future delete(Stuff stuff) async {
    final finder = Finder(filter: Filter.byKey(stuff.id));
    await _stuffFolder.delete(await _db, finder: finder);
  }
}
