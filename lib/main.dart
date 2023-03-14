import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const batteryLevel = MethodChannel("shakiy.com/battery");
  int _counter = 0;
  int batlevel =0;

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
            const Text(
              'Battery level ',
            ),
          
            Text(
              batlevel.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: getbatteryLevel
            , child: const Text("Check Battery"))
          ],
        ),
      ),
    );
  }

getbatteryLevel() async {
  batlevel = await batteryLevel.invokeMethod("getBattery");
  print(batlevel);
}
}
