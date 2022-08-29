import 'package:flutter/material.dart';

import 'footballList.dart';
import 'formRegistration.dart';
import 'kalkulator.dart';

class tabBarExample extends StatefulWidget {
  const tabBarExample({Key? key}) : super(key: key);

  @override
  State<tabBarExample> createState() => _tabBarExampleState();
}

class _tabBarExampleState extends State<tabBarExample> with SingleTickerProviderStateMixin{
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.app_registration_outlined)),
    Tab(icon: Icon(Icons.calculate_outlined)),
    Tab(icon: Icon(Icons.sports_baseball_outlined)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (value) {},
            controller: _controller,
            tabs: list,
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(controller: _controller, children: [
          Center(
            child: formRegistration()),
          Center(
              child: kalkulator()),
          Center(
              child: footballList()),
        ]),
      ),
    );
  }
}