import 'package:carapi/dio/authController.dart';
import 'package:carapi/utils/build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final _key = GlobalKey<FormState>();
  String? _email = 'shayannawroz@gmail.com';
  String? _password = '123456';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
    });
    return Scaffold(
      body: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              homeBuild(
                image: 'assets/images/home_image.png',
                title: 'بـەخـێـربـێیـت',
                subtitle: 'تــکـایـە هـەژمـارێـک دابـبنـێ بـۆ چـوونـە ژوورەوە',
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                    onPressed: () async {
                      if (_key.currentState != null) {
                        if (_key.currentState!.validate()) {
                          await ref.read(authControllerProvider.notifier).login(_email!, _password!);
                        }
                      }
                    },
                    child: const Text(
                      'چـوونـەژورەوە',
                      style: TextStyle(fontSize: 22, fontFamily: 'kurdish_bold', color: Colors.black),
                    )),
              ),
            ],
          )),
    );
  }
}
