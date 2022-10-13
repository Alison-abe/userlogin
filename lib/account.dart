
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'login.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text("Account"),
        backgroundColor:const Color.fromARGB(255, 211, 121, 30),
        actions: [
          Tooltip(
            message: "LogOut",
            child: IconButton(onPressed: (){
              Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx)=>Login())
                  );
            }, icon:const Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [
          Center(
            child:Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))
          )
        ],
      ),
    );
  }
}