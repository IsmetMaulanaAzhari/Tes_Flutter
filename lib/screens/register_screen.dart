import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00D4E6), 
              Color(0xFF8B5CF6), 
              Color(0xFFE91E63), 
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        Expanded(
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 32),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Type your name",
                        prefixIcon: Icon(Icons.person_outline, color: Colors.grey.shade600),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Type your email",
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey.shade600),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Type your password",
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade600),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF00D4E6), // Cyan
                              Color(0xFFE91E63), // Pink/Magenta
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/login");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "CREATE ACCOUNT",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Sudah punya akun? Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
