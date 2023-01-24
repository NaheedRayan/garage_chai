import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:garage_chai/auth/login.dart';
import 'package:garage_chai/home.dart';
import 'package:garage_chai/main.dart';
import 'package:pinput/pinput.dart';

class MyVerify extends StatefulWidget {

  const MyVerify({Key? key,}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img1.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff546238)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter the OTP code that has been sent",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff546238),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) => print(pin),
                onChanged: (value) {
                  code = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff38BB6E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try {
                        // Create a PhoneAuthCredential with the code
                        PhoneAuthCredential credential = PhoneAuthProvider
                            .credential(
                            verificationId: login.verify, smsCode: code);


                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);


                        late FirebaseAuth _auth = FirebaseAuth.instance ;
                        late Stream<User?> _authStateChanges = _auth.authStateChanges() ;
                        User user ;
                        _authStateChanges.listen((User? user) async {
                          print("...user id ${user?.uid}\n");
                          print("...user email ${user?.email}\n");
                          print("...user verified ${user?.emailVerified}\n");
                          print("...user phone ${user?.phoneNumber}\n");
                          print("...user name ${user?.displayName}\n");
                          print("...user metadata ${user?.metadata}\n");


                          var doc = await FirebaseFirestore.instance.collection("users").doc(user?.phoneNumber).get() ;
                          var y = user!.phoneNumber ;
                          MyApp.user_phone_number = y! ;


                          var data = {
                            "username":"",
                            "uuid":user?.uid ,
                            "phoneNumber":user?.phoneNumber,
                            "photoURL":"",
                            "email":"",
                            "emailVerified":"",
                            "createdAt":  DateTime.now(),


                            "card_car":"Unverified",
                            "card_bike":"Unverified",
                            "card_cycle":"Unverified",
                            "card_mini_truck":"Unverified",
                            "card_garage":"Unverified",

                          };
                          if(!doc.exists){
                            FirebaseFirestore.instance.collection("users").doc(user?.phoneNumber).set(data);
                          }

                        });
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const home()), (route) => false);
                      }catch(e){
                        var errorMessage = "";
                        switch (e) {
                          case "ERROR_EMAIL_ALREADY_IN_USE":
                          case "account-exists-with-different-credential":
                          case "email-already-in-use":
                            errorMessage = "Email already used. Go to login page.";
                            break;
                          case "ERROR_WRONG_PASSWORD":
                          case "wrong-password":
                            errorMessage =  "Wrong email/password combination.";
                            break;
                          case "ERROR_USER_NOT_FOUND":
                          case "user-not-found":
                            errorMessage = "No user found with this email.";
                            break;
                          case "ERROR_USER_DISABLED":
                          case "user-disabled":
                            errorMessage = "User disabled.";
                            break;
                          case "ERROR_TOO_MANY_REQUESTS":
                          case "operation-not-allowed":
                            errorMessage = "Too many requests to log into this account.";
                            break;
                          case "ERROR_OPERATION_NOT_ALLOWED":
                          case "operation-not-allowed":
                            errorMessage = "Server error, please try again later.";
                            break;
                          case "ERROR_INVALID_EMAIL":
                          case "invalid-email":
                            errorMessage = "Email address is invalid.";
                            break;
                          default:
                            errorMessage = "Login failed. Please try again.";
                            break;
                        }
                        if (errorMessage != null) {
                          // print(errorMessage);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
                          await FirebaseAuth.instance.signOut();
                        }

                      }
                    },
                    child: Text("Verify Phone Number")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
