import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/my_routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  XFile? image;
  final ImagePicker picker = ImagePicker();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<User?> registerUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        user = userCredential.user;
        user = auth.currentUser;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      uploadImage(image);

      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
    return user;
  }

  Future getImage(ImageSource sourceImage) async {
    var img = await picker.pickImage(source: sourceImage, imageQuality: 25);

    setState(() {
      image = img;
    });
  }

  uploadImage(XFile? img) {
    if (img != null) {
      DateTime datetime = DateTime.now();
      String dateStr = datetime.toString();
      var path = 'images/$dateStr${img.name}';
      var pickedImage = File(img.path);
      final ref = FirebaseStorage.instance.ref().child(path);
      ref.putFile(pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset('assests/images/login_image.png'),
                    "Registration Page".text.xl2.bold.make().p32(),
                    Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "Value cannot be empty";
                            }
                            return null;
                          },
                        ).p8(),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "Value cannot be empty";
                            }
                            return null;
                          },
                        ).p8(),
                        Row(
                          children: [
                            Container(
                                    child: image == null
                                        ? Image.asset(
                                            "assests/images/default_pfp.jpg")
                                        : Image.file(File(image!.path)))
                                .wh(50, 50)
                                .cornerRadius(50)
                                .p8(),
                            ElevatedButton(
                                    onPressed: () {
                                      // Navigator.pop(context);
                                      getImage(ImageSource.gallery);
                                    },
                                    child: "Gallery".text.make())
                                .p8(),
                            ElevatedButton(
                                    onPressed: () {
                                      getImage(ImageSource.camera);
                                    },
                                    child: "Camera".text.make())
                                .p8()
                          ],
                        ).p16(),
                        ElevatedButton(
                                onPressed: () {
                                  registerUsingEmailPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                                },
                                child: "Submit".text.make())
                            .wh(100, 40)
                            .p32(),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            },
                            child: "Sign In".text.make()),
                      ],
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
