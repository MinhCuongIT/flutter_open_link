import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Open Link:'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _txt = TextEditingController();

  void _openLink() async {
    final canOpen = await canLaunch(_txt.text);
    if (canOpen) {
      launch(_txt.text);
    } else {
      showToast('Không thể mở đường dẫn!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Open URL:',
            ),
            TextField(
              controller: _txt,
              decoration: InputDecoration(hintText: 'https://google.com'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openLink,
        child: Icon(Icons.open_in_browser),
      ),
    );
  }
}
