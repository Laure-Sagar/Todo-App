import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  String value;
  var _listTODO = [''];

  addTODO(String item) {
    setState(() {
      _listTODO.add(item);
    });
  }

  removeItem(String item) {
    setState(() {
      _listTODO.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('To Do App'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addTODO(value),
      ),
      body: ListView.builder(
          itemCount: _listTODO.length,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      onChanged: (val) {
                        value = val;
                      },
                    ),
                  )
                : ListTile(
                    title: Text('${_listTODO[index]}'),
                    leading: Icon(Icons.bookmark),
                    trailing: TextButton(
                      child: Icon(Icons.close),
                      onPressed: () {
                        removeItem('${_listTODO[index]}');
                      },
                    ),
                    subtitle: Text("This not Completed"),
                  );
          }),
    );
  }
}
