import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/counterModel.dart';
import 'package:state_management/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter App',
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: const HomeScreen(),
      ),
    );
  }
}
