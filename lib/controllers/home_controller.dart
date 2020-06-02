import 'package:borrowed_flutter/database/stuff_dao.dart';
import 'package:borrowed_flutter/models/stuff.dart';

class HomeController {
  final _dao = StuffDao();
  final stuffList = [];

  void create(Stuff stuff) {
    _dao.create(stuff);
    stuffList.add(stuff);
  }

  Future<void> readAll() async {
    final list = await _dao.readAll();
    stuffList.addAll(list);
  }

  void update(int index, Stuff stuff) {
    _dao.update(stuff);
    stuffList[index] = stuff;
  }

  void delete(Stuff stuff) {
    _dao.delete(stuff);
    stuffList.remove(stuff);
  }
}
