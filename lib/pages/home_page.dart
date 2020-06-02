import 'package:borrowed_flutter/components/centered_circular_progress.dart';
import 'package:borrowed_flutter/components/centered_message.dart';
import 'package:borrowed_flutter/components/stuff_card.dart';
import 'package:borrowed_flutter/controllers/home_controller.dart';
import 'package:borrowed_flutter/pages/stuff_detail_page.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller.readAll().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Objetos Emprestados'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Emprestar'),
        icon: Icon(Icons.add),
        onPressed: () {
          _addStuff();
        },
      ),
      body: _buildListView(),
    );
  }

  _buildListView() {
    if (_loading) {
      return CenteredCircularProgress();
    }

    if (_controller.stuffList.length == 0) {
      return CenteredMessage(
        'Vazio',
        icon: Icons.sentiment_satisfied,
      );
    }

    return ListView.builder(
      itemCount: _controller.stuffList.length,
      itemBuilder: (context, index) {
        final stuff = _controller.stuffList[index];
        return StuffCard(
          stuff: stuff,
          onEdit: () {
            _editStuff(index, stuff);
          },
          onDelete: () {
            _deleteStuff(stuff);
          },
        );
      },
    );
  }

  _editStuff(index, stuff) async {
    final editedStuff = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StuffDetailPage(editedStuff: stuff),
      ),
    );
    
    if (editedStuff != null) {
      setState(() {
        _controller.update(index, stuff);
      });

      Flushbar(
        title: 'Empréstimo',
        message: 'Empréstimo editado com sucesso!',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )..show(context);
    }
  }

  _deleteStuff(stuff) async {
    print('Delete stuff');

    if (stuff != null) {
      setState(() {
        _controller.delete(stuff);
      });
    }

    Flushbar(
      title: 'Empréstimo',
      message: '${stuff.description} excluído com sucesso!',
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    )..show(context);
  }

  _addStuff() async {
    print('Add stuff');
    final stuff = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StuffDetailPage(),
      ),
    );
    
    if (stuff != null) {
      setState(() {
        _controller.create(stuff);
      });

      Flushbar(
        title: 'Empréstimo',
        message: 'Novo empréstimo realizado com sucesso!',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      )..show(context);
    }
  }
}
