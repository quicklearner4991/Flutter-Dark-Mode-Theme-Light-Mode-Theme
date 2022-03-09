import 'package:cs_flutter/navigation/app_routes.dart';
import 'package:cs_flutter/providers/login_provider.dart';
import 'package:cs_flutter/providers/signup_provider.dart';
import 'package:cs_flutter/screens/login_screen.dart';
import 'package:cs_flutter/screens/signup_screen.dart';
import 'package:cs_flutter/utils/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeState>(
    create: (context) => ThemeState(),
    child: MyApp(),
  ));
 /* runApp(const MyApp());*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeState>(context).theme == ThemeType.DARK
            ? ThemeData.dark()
            : ThemeData.light(),
        routes: AppRoutes.define(),
        onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
        /*home: const MyHomePage(),*/
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("HOME"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                'Login Screen',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
                child: Switch(
                    value: Provider.of<ThemeState>(context).theme ==
                        ThemeType.DARK,
                    onChanged: (value) {
                      Provider.of<ThemeState>(context, listen: false).theme =
                          value ? ThemeType.DARK : ThemeType.LIGHT;
                      setState(() {});
                    })),
          ],
        ),
      ),
    );
  }
}
