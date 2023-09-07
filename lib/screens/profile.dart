import 'package:app_music/models/authentic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${FirebaseAuth.instance.currentUser?.photoURL}')),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: Colors.redAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${FirebaseAuth.instance.currentUser?.displayName}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 50),
            information(Icons.email_outlined,
                FirebaseAuth.instance.currentUser!.email.toString()),
            const SizedBox(height: 10),
            information(Icons.phone,
                FirebaseAuth.instance.currentUser!.phoneNumber.toString()),
            const SizedBox(height: 50),
            InkWell(
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Log out',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              onTap: () {
                AuthService().logOutGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget information(IconData icon, String textInf) {
  if (textInf == "null") {
    textInf = '';
  }
  return Row(
    children: [
      const SizedBox(width: 20),
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(50)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      const SizedBox(width: 20),
      Text(
        textInf,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      ),
    ],
  );
}
