// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> Users=[
      UserModel(number: 1, name: "Ahmed Yasser Hussein", PhoneNumber: "+2012345678"),
      UserModel(number: 2, name: "Ahmed Ali Mohamed", PhoneNumber: "+2012345678"),
       UserModel(number: 3, name: "Ali mohamed Hany", PhoneNumber: "+2012155678"),
       UserModel(number: 1, name: "Ahmed Yasser Hussein", PhoneNumber: "+2012345678"),
      UserModel(number: 2, name: "Ahmed Ali Mohamed", PhoneNumber: "+2012345678"),
       UserModel(number: 3, name: "Ali mohamed Hany", PhoneNumber: "+2012155678"),
       UserModel(number: 1, name: "Ahmed Yasser Hussein", PhoneNumber: "+2012345678"),
      UserModel(number: 2, name: "Ahmed Ali Mohamed", PhoneNumber: "+2012345678"),
       UserModel(number: 3, name: "Ali mohamed Hany", PhoneNumber: "+2012155678"),
       UserModel(number: 1, name: "Ahmed Yasser Hussein", PhoneNumber: "+2012345678"),
      UserModel(number: 2, name: "Ahmed Ali Mohamed", PhoneNumber: "+2012345678"),
       UserModel(number: 3, name: "Ali mohamed Hany", PhoneNumber: "+2012155678"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(itemBuilder: ((context, index) => buildUserItem(Users[index])), 
      separatorBuilder:((context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 25.0,
        ),
        child: Container(color: Colors.grey[300],height: 1.0,width: double.infinity,),
      ))
       , itemCount: Users.length)
    );
  }
  Widget buildUserItem( UserModel User)=> Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${User.number}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20.0,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Text(
                '${User.name}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Text(
                  '${User.PhoneNumber}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}

class UserModel {
  final int number;
  final String name;
  final String PhoneNumber;
  UserModel({
    required this.number,
    required this.name,
    required this.PhoneNumber,
  });
}
