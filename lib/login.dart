
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_social/profile.dart';

import 'User.dart';
import 'http_helper.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  late HttpHelper helper;
  late int usersCount=0;
  late List users=<User>[User(1, 'name', 'username', 'email',Address('street', 'suite', 'city', 'zipcode', Geo('lat', 'lng')),
      'phone', 'website', Company('name', 'catchPhrase', 'bs'))];

  Future findUserByEmail(text) async {
   // users = [];
    users = await helper.findUserByEmail(text);
    setState(() {
      usersCount = users.length;
      if(usersCount==0) {
        usersCount=1;
        users=<User>[User(1, 'name', 'username', 'email',Address('street', 'suite', 'city', 'zipcode', Geo('lat', 'lng')),
            'phone', 'website', Company('name', 'catchPhrase', 'bs'))];
      }else{
        users = users;
      }
      }
    );
  }
  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Red Social Example'),
      ),
      body: Center(

          child: ListView(
            padding: EdgeInsetsDirectional.fromSTEB(12, MediaQuery.of(context).size.height/4, 12, 12),

            children:[
              TextField(
                onSubmitted: (String text) {
                  findUserByEmail(text);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
             // Text(users[0].name),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.orange;
                      }
                      return null; // defer to the defaults
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.white;
                      }
                      return null; // defer to the defaults
                    },
                  ),
                ),

                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(builder: (_) => Profile(users[0]));
                  Navigator.push(context, route);
                },
                child: const Text('Log in'),
              ),

              Text('Example email: Julianne.OConner@kory.org')]
          )
      )

    );
  }
}