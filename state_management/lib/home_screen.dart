import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final localStorage = FlutterSecureStorage();
  final List data = [
    {'name': 'Yamini'},
    {'name': 'Praveen'},
    {'name': 'Shravani'},
    {'name': 'Richard'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: ListView(
        children: [
          ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]),
                );
              }),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences.setMockInitialValues({});
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('data', data.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                );
              },
              child: Text('Go to next Screen'))
        ],
      ),
    );
  }
}
