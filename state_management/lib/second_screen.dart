import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/home_screen.dart';

import 'counterModel.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decrementer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                //counterModel is the object of CounterModel class
                Consumer<CounterModel>(builder: (context, counterModel, child) {
                  return Text(
                    '${counterModel.counter}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Icon(Icons.remove),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0XFFCDC4D7),
                        width: 1,
                      ),
                    ),
                  ),
                  onTap: () {
                    context.read<CounterModel>().decrementCounter();
                    // Provider.of<CounterModel>(context, listen: false)
                    //     .incrementCounter();
                  },
                ),
                Spacer(),
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0XFFAEB1D7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Icon(
                            Icons.skip_previous_sharp,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Previous Page",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
