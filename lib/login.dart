import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:userlogin/signin.dart';


class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final passcontroller = TextEditingController();
  final phonecontroller = TextEditingController();

  String phone = "";
  String countrycode="+91";
  static String verify="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Phone Verification",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 211, 121, 30)),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Get your phone number registered!",
                    style: TextStyle(color: Color.fromARGB(255, 211, 121, 30)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 161, 146, 122)),
                    controller: phonecontroller,
                    onChanged: (value) {
                      phone = value;
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                        hintText: "+91",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 211, 121, 30)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${countrycode+phone}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Login.verify=verificationId;
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => SignIn())));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );

                      
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 211, 121, 30))),
                    child: const Text("Send code"),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
