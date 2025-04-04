import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scan4health/wrapper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAll(() => const Wrapper()); // Rediriger après l'inscription
    } catch (e) {
      Get.snackbar("Erreur", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Enter email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true, // Pour masquer le mot de passe
              decoration: const InputDecoration(labelText: 'Enter Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: signup, child: const Text('Sign up')),
          ],
        ),
      ),
    );
  }
}
