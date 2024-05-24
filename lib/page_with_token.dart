
import 'package:crud_restapi/model/login_mode.dart';
import 'package:crud_restapi/service/meal_service.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: email,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: password,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        bool status = await login(LoginMode(email: email.text, password: password.text));

        if (status) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Success"),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ));

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MealPage(),
              ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Error"),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ));
        }
      }),
    );
  }
}

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getAllMeal(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                },
                title: Text(snapshot.data![index].name!),
              
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
