import 'package:crud_restapi/config/get_it.dart';
import 'package:crud_restapi/model/user_model.dart';
import 'package:crud_restapi/page_with_token.dart';
import 'package:crud_restapi/service/user_service.dart';
import 'package:flutter/material.dart';

void main() {
  // setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController univ = TextEditingController();

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
                controller: name,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: univ,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        bool status = await UserService()
            .createUser(UserModel(name: name.text, univ: univ.text));

        if (status) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Success"),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ));

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserPage(),
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

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: UserService().getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  // storage
                  //     .get<SharedPreferences>()
                  //     .setString('name', snapshot.data![index].name!);
                },
                title: Text(snapshot.data![index].name!),
                leading: (snapshot.data![index].avatar != null)
                    ? Image.network(
                        snapshot.data![index].avatar!,
                        errorBuilder: (context, error, stackTrace) {
                          return FlutterLogo();
                        },
                      )
                    : FlutterLogo(),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(),
            ));
      }),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Text(storage.get<SharedPreferences>().getString('name')!),
      ),
    );
  }
}
