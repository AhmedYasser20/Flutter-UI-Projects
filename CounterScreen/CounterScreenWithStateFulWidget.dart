// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class counterScreen extends StatefulWidget {
 
  @override
  State<counterScreen> createState() => _counterScreenState();
}

class _counterScreenState extends State<counterScreen> {
  int counter=1;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              setState(() {
                 counter--;
              });
             
            }, child: 
            Text('MINUS'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('$counter',style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: 50.0,
              ),),
            ),
            TextButton(onPressed: (){
              setState(() {
                counter++;
              });
              
            }, child: 
            Text('PLUS'),
            ),
          ],
        ),
      ),
    );
  }
}
