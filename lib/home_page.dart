import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var days = 10;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Text("App"),
        ),
      ),
      body: Center(
        child: Container(
          child: Text('sup boiz $days'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
