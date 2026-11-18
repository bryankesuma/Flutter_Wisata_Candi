import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wisata_candi_2627_51/provider/auth_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = "";
  bool _isSignedIn = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //todo 5 pengguna
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //todo 6 sandi
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      border: OutlineInputBorder(),
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  //todo 7 Sign In
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // SignInScreen, fungsi _signIn
                      void _signIn() {
                        final name = _usernameController.text.trim();
                        if (name.isEmpty) return;
                        context.read<AuthProvider>().signIn(name);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Sign In'),
                  ),
                  //todo 8 Sign Up
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Belum Punya Akun?',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
