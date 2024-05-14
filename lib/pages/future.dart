import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:interceptorexample/pages/logic/futurelogic.dart';

class Futures extends ConsumerWidget {
  const Futures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FutureProvider",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 217, 168, 226),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/QWc9.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ref.watch(futureDataProvider).when(
            data: (user) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: user.users.isNotEmpty ? user.users.length : 1,
                itemBuilder: (context, index) {
                  if (user.users.isEmpty) {
                    return Center(
                      child: Text('No options found'),
                    );
                  } else {
                    final userData = user.users[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          userData.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User ID: ${userData.userid}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "ID: ${userData.id}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(userData.body),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            },
            error: (error, _) {
              return Center(
                child: Text('Error: $error'),
              );
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
