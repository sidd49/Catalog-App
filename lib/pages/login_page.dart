
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    

    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  String name = "";
  bool onchange = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onchange = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        onchange = false;
      });
    }
  }

 Future<User?> signInUsingEmailPassword({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  if(user != Null)
  {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onchange = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        onchange = false;
      });
    }
  }
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    }
  }

  return user;
}

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assests/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              hintText: "Enter Username",
                              labelText: "Username"),
                          validator: (value) {
                            if (value == "") {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                          validator: (value) {
                            if (value == "") {
                              return "Password cannot be empty";
                            } else if (value!.length < 6) {
                              return "Password should have atleast 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Material(
                          color: context.theme.splashColor,
                          borderRadius:
                              BorderRadius.circular(onchange ? 50 : 8),
                          child: InkWell(
                              onTap: () => signInUsingEmailPassword( email : emailController.text.trim(), password: passwordController.text.trim(),context: context),
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                width: onchange ? 50 : 150,
                                height: 50,
                                alignment: Alignment.center,
                                // ignore: sort_child_properties_last
                                child: onchange
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                              )),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
   
    
  }
}
