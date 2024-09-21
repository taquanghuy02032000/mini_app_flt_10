import 'package:flutter/material.dart';
import 'package:mini_app/utils/firebase/login/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                ),
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  FireBaseUtil fireBaseUtil = FireBaseUtil();
                  fireBaseUtil.createUserByEmailAndPw(
                    email: _email.text,
                    password: _password.text,
                  );
                },
                child: Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
