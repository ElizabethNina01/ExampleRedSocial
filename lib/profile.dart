import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class Profile extends StatelessWidget{

  final User user;

  Profile(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(user.name),
          ),
        body: Container(
          child: ListView(
              padding: EdgeInsetsDirectional.fromSTEB(12,12, 12, 12),

              children:[
                CircleAvatar(
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                    width: 100,
                    height: 100,
                  ),
                  radius: 50,
                ),

                  Text('Name'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: user.name,
                    ),
                    enabled: false,
                  ),

                  Text('Username'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: user.username,
                    ),
                    enabled: false,
                  ),

                  Text('Email'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: user.email,
                    ),
                    enabled: false,
                  ),

                  Text('Address'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: user.address.street+' '+user.address.suite+' '+user.address.city,
                    ),
                    enabled: false,
                  ),


                  Text('Zipcode'),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: user.address.zipcode,
                    ),
                    enabled: false,
                  ),

              ]
          )
        )
    );
  }
}