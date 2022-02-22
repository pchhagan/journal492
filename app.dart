import 'package:flutter/material.dart';
import 'package:journal/widgets/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/newEntry.dart';

void main() {
  runApp(App(preferences: null,));
}

class App extends StatefulWidget {
  final SharedPreferences? preferences;
  App({Key? key, @required this.preferences}) : super(key: key);
  static final routes = {JournalEntry.routeName: (context) => JournalEntry()};

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool lights = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: lights ? ThemeData.light() : ThemeData.dark(),
        routes: App.routes,
        home: Scaffold(
          appBar: AppBar(
              title: Text('Journal Entries'), leading: Builder(
  builder: (context) {
    return (ModalRoute.of(context)!.canPop &&
            Scaffold.of(context).isEndDrawerOpen)
      ? const BackButton()
      : const SizedBox.shrink();
  }
)),
          endDrawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
              DrawerHeader(child: Text("Header")),
              SwitchListTile(
                  title: Text('Dark Mode'),
                  value: lights,
                  onChanged: (bool value) {
                    setState(() {
                      lights = value;
                    });
                  })
            ]),
          ),
          body: LayoutBuilder(builder: layoutDecider),
        ));
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
      constraints.maxWidth < 500 ? VerticalLayout() : HorizontalLayout();
}

class HorizontalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyHomePage());
  }
}

class VerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightGreen);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Welcome()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushJournal(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void pushJournal(BuildContext context) {
  Navigator.of(context).pushNamed(JournalEntry.routeName);
}
