import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_db/Persondata_provider.dart';
import 'package:login_db/ProfilePage.dart';
import 'package:provider/provider.dart';

class Updatepage extends StatefulWidget {
  static const String routeName = "/UpdatePage";
  const Updatepage({super.key});

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    TextEditingController _username =TextEditingController(text: personProvider.singlepersondata.Username.toString());
    TextEditingController _password = TextEditingController(text: personProvider.singlepersondata.Email.toString());
    TextEditingController _email = TextEditingController(text: personProvider.singlepersondata.Password.toString());

    if (personProvider.status == "data") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        personProvider.toggleFav();
        Navigator.pushNamed(context, Profilepage.routeName);
      });
    }

    else if (personProvider.status == "error") {
      personProvider.errorMessage;
    }
    //if(Provider.of<PersonProvider>(context, listen: true).status == "loading") CircularProgressIndicator();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/Login.png"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                labelText: 'Enter username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.people),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                labelText: 'Enter email address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                labelText: 'Enter password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.text_format_sharp),
              ),
            ),
          if(personProvider.status== "loading") CircularProgressIndicator(),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity, // This makes the button take up full width
              child: ElevatedButton(
                onPressed: () {
                  personProvider.getUpdateFromAPI(_username.text, _email.text, _password.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text('Update'),

              ),
            ),
            //Text(personProvider.status),
          ],
        ),
      ),
    );

  }
}
