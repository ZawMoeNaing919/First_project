import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_db/LoginPage.dart';
import 'package:login_db/Persondata_provider.dart';
import 'package:login_db/UpdatePage.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  static const String routeName = "/ProfilePage";
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}
class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    TextEditingController _username =TextEditingController(text: personProvider.singlepersondata.Username.toString());
    TextEditingController _password = TextEditingController(text: personProvider.singlepersondata.Email.toString());
    TextEditingController _email = TextEditingController(text: personProvider.singlepersondata.Password.toString());

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
          title: Text("Profile Page"),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Aligns the FAB to the right
              children: [
                FloatingActionButton(
                  onPressed: () {
                    personProvider.toggleFav();
                    Navigator.pushNamed(context, Updatepage.routeName);
                  },
                  child: Icon(Icons.edit)
                ),
              ]
            ),

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
            if (personProvider.status == "loading") CircularProgressIndicator(),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity, // This makes the button take uqp full width
              child: ElevatedButton(
                onPressed: () {
                  print("delete");
                  personProvider.getDeleteFromAPI(_username.text, _email.text, _password.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text('Delete your account!'),

              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity, // This makes the button take up full width
              child: ElevatedButton(
                onPressed: () {
                  print("update");

                  Navigator.pushNamed(context, LoginPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text('Logout'),
              ),
            ),
            Text(personProvider.status),

          ],

        ),
      ),
    );
  }
}
