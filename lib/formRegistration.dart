import 'package:flutter/material.dart';

import 'SecondRoute.dart';

class formRegistration extends StatefulWidget {
  const formRegistration({Key? key}) : super(key: key);

  @override
  State<formRegistration> createState() => _formRegistrationState();
}

class _formRegistrationState extends State<formRegistration> {
  TextEditingController ctrUsername = new TextEditingController();
  TextEditingController ctrPassword = new TextEditingController();
  TextEditingController ctrPhone = new TextEditingController();

  int id = 1;
  String phoneNumber = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Form Registration")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: ctrUsername,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrPassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Pilih jenis kelamin",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        id = 1;
                      });
                    },
                  ),
                  Text("Male"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        id = 2;
                      });
                    },
                  ),
                  Text("Female")
                ],
              ),
              Text("Phone number: " + phoneNumber),
              ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()),
                    );
      
                    setState(() {
                      phoneNumber = result.toString();
                    });
                  },
                  child: Text("Input Phone number")),
              Center(
                  child: Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
