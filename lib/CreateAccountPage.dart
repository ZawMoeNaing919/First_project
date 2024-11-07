import 'package:flutter/material.dart';
import 'package:login_db/Persondata_provider.dart';
import 'package:provider/provider.dart';

import 'LoginPage.dart';

class Createaccountpage extends StatefulWidget {
  static const String routeName = "/CreateAccountPage";

  const Createaccountpage({super.key});

  @override
  State<Createaccountpage> createState() => _CreateaccountpageState();
}

class _CreateaccountpageState extends State<Createaccountpage> {
  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _confirmpassword = TextEditingController();

    if (personProvider.status == "data") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        personProvider.toggleFav();
        Navigator.pushNamed(context, LoginPage.routeName);
      });
    }

    else if (personProvider.status == "error") {
      personProvider.errorMessage;
    }
    //if(Provider.of<PersonProvider>(context, listen: true).status == "loading") CircularProgressIndicator();

    return Scaffold(
        appBar: AppBar(
          title: Text("Create a New Account!"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 30),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                labelText: 'Enter username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.people),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                labelText: 'Enter email address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                labelText: 'Enter password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.text_format_sharp),
              ),
            ),

            SizedBox(height: 30),
            TextField(
              controller: _confirmpassword,
              decoration: InputDecoration(
                labelText: 'Enter confirm password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            if(personProvider.status == "loading") CircularProgressIndicator(),
            SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5, // Shadow depth
                  padding: EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                onPressed: () {
                  personProvider.toggleFav();
                  personProvider.getRegisterFromAPI(_username.text, _email.text, _password.text);
                },
                child: Text("Create")),
                //Text(personProvider.status),

          ],
        )
        )
    );
  }
}
