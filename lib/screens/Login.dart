import 'package:app_music/models/authentic.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/bg_splash.jpg',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 120),
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome back!\nSign in to continue!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    AuthService().signInWithGoogle();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                          height: 50,
                        ),
                        Text(
                          "Log in with Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.85),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'or',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.white70)),
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        prefixIconColor: Colors.white70,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.green),
                        )),
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.85), fontSize: 15),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.white70)),
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.key),
                        prefixIconColor: Colors.white70,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.green),
                        )),
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
