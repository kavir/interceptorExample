import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:interceptorexample/pages/logic/statellogic.dart';

class FuturesFromStateNotifier extends ConsumerStatefulWidget {
  const FuturesFromStateNotifier({Key? key}) : super(key: key);

  @override
  ConsumerState<FuturesFromStateNotifier> createState() =>
      _FuturesFromStateNotifierState();
}

class _FuturesFromStateNotifierState
    extends ConsumerState<FuturesFromStateNotifier> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.read(postNotifierProvider.notifier).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final getdata = ref.watch(postNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StateNotifierProvider",
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
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/QWc9.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: getdata.when(initial: () {
          return Center(child: CircularProgressIndicator());
        }, loading: (loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }, error: (error) {
          return Center(
            child: Text("error"),
          );
        }, success: (data, extra) {
          return ListView.builder(
            itemCount: data!.users.length,
            // separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    data!.users[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  subtitle: Text(data!.users[index].body),
                ),
              );
            },
          );
        }),
      ),
      // body: getdata.maybeWhen(
      //   orElse: () {
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },

      //   // loading: (loading) {
      //   //   return Center(
      //   //     child: CircularProgressIndicator(),
      //   //   );
      //   // },
      //   success: (data, extra) {
      //     return ListView.builder(
      //       itemCount: data!.users.length,
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           title: Text(data!.users[index].title),
      //           subtitle: Text(data!.users[index].body),
      //         );
      //       },
      //     );
      //   },
      //   error: (data) {
      //     return Center(
      //       child: Text('Error: '),
      //     );
      //   },
      // )
    );
  }
}
