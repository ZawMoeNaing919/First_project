import 'package:flutter/material.dart';
import 'package:login_db/Persondata_provider.dart';
import 'package:login_db/ProfilePage.dart';
import 'package:provider/provider.dart';

import 'CreateAccountPage.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/LoginPage";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _email = TextEditingController();

    final personProvider = Provider.of<PersonProvider>(context);

    if (personProvider.status == "data") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        personProvider.toggleFav();
        Navigator.pushNamed(context, Profilepage.routeName);
      });
    }
    else if (personProvider.status == "error") {
      personProvider.errorMessage;
    }


    // if(Provider.of<PersonProvider>(context, listen: true).status == "error") Text(personProvider.status);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 47,
              // Font size
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              // Font weight
              color: Colors.green,
              // Text color
              letterSpacing: 9,
              // Space between letters
              shadows: [
                Shadow(
                  blurRadius: 3.0,
                  color: Colors.red.withOpacity(0.5), // Shadow color
                  offset: Offset(1.0, 1.0), // Shadow offset
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/images/Login.png",
                      width: 100,
                      height: 300,
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        TextField(
                          controller: _username,
                          decoration: InputDecoration(
                            labelText: 'Enter username',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.people_outline),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            labelText: 'Enter email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _password,
                          decoration: InputDecoration(
                            labelText: 'Enter password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.password),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(onPressed: () {

                          personProvider.getLoginFromAPI(_username.text, _email.text, _password.text);
                        }, child: Text("Login")),
                        //Text(personProvider.status),
                      ],
                    )),

              ],
            ),
            if(personProvider.status == "loading") CircularProgressIndicator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      personProvider.toggleFav();
                      Navigator.pushNamed(context, Createaccountpage.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.create),
                        Text("Create a new account!")
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
