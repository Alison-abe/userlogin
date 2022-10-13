import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:userlogin/account.dart';
import 'package:userlogin/login.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
 
 final snamecontroller=TextEditingController();
 final sphonecontroller=TextEditingController();
 final spasscontroller=TextEditingController();
  final FirebaseAuth auth=FirebaseAuth.instance;
  String code="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                const Text("Phone Verification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromARGB(255, 211, 121, 30)),),
                const SizedBox(height: 50,),
               const Text("Enter the verification code here",style: TextStyle(color:  Color.fromARGB(255, 211, 121, 30)),),
                const SizedBox(height: 30,),
                Form(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height:50,
                      width: 50,
                      child:TextFormField(
                        style: const TextStyle(color: Color.fromARGB(255, 161, 146, 30)),
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Color.fromARGB(255, 161, 146, 30)),
                        ),
                        onChanged: ((value) {
                          code='${code+value}';
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        }),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )
                    ),
                    SizedBox(
                      height:50,
                      width: 50,
                      child:TextFormField(
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        ),
                        onChanged: ((value) {
                          code='${code+value}';
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        }),
                        style: const TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )
                    ),SizedBox(
                      height:50,
                      width: 50,
                      child:TextFormField(
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        ),
                        onChanged: ((value) {
                          code='${code+value}';
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        }),
                        style: const TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )
                    ),SizedBox(
                      height:50,
                      width: 50,
                      child:TextFormField(
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        ),
                        onChanged: ((value) {
                          code='${code+value}';
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        }),
                        style: const TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )
                    ),SizedBox(
                      height:50,
                      width: 50,
                      child:TextFormField(
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        ),
                        onChanged: ((value) {
                          code='${code+value}';
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        }),
                        style: const TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )
                    ),SizedBox(
                      height:50,
                      width: 50,
                      child:TextFormField(
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        ),
                        onChanged: ((value) {
                          code='${code+value}';
                          if(value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        }),
                        style: const TextStyle(color: Color.fromARGB(255, 161, 146, 122)),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )
                    ),
                  
                  ],
                )),
                  const SizedBox(height: 30,),
                  ElevatedButton(onPressed: ()async{
                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Login.verify, smsCode: code);
                    await auth.signInWithCredential(credential);
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Account())));
                    }catch(e){
                     Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SignIn())));
                    }
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 211, 121, 30))),
              child:const Text("Verify Phone Number"),
              ),
              const SizedBox(height: 15,),
              Row(children: [
                TextButton(onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx)=>Login())
                  );
                }, 
                child: const Text("Edit Phone Number?"))
              ],
              )
          ],
        ),
      ),
    );
  }
                
}