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
              Color(0xFF4CAF50), // Light Green
              Color(0xFF2E7D32), // Dark Green
              Color(0xFF1B5E20), // Very Dark Green
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Stack(
              children: [
                // Decorative plant icons
                Positioned(
                  top: 40,
                  left: 15,
                  child: Icon(
                    Icons.local_florist,
                    color: Colors.white.withOpacity(0.3),
                    size: 28,
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 20,
                  child: Icon(
                    Icons.agriculture,
                    color: Colors.white.withOpacity(0.3),
                    size: 26,
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 25,
                  child: Icon(
                    Icons.forest,
                    color: Colors.white.withOpacity(0.3),
                    size: 30,
                  ),
                ),
                Positioned(
                  bottom: 200,
                  right: 35,
                  child: Icon(
                    Icons.spa,
                    color: Colors.white.withOpacity(0.3),
                    size: 24,
                  ),
                ),
                
                // Main Card
                Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Back button row
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Spacer(),
                      ],
                    ),
                    
                    // Create Account Icon
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4CAF50),
                            Color(0xFF2E7D32),
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.shade200,
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person_add,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // App Branding
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.nature_people,
                          color: Colors.green.shade600,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "FreshBite",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Icons.nature_people,
                          color: Colors.green.shade600,
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                    const Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),

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
                          borderSide: BorderSide(color: Colors.green),
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
                          borderSide: BorderSide(color: Colors.green),
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
                          borderSide: BorderSide(color: Colors.green),
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
              Color(0xFF4CAF50), // Light Green
              Color(0xFF2E7D32), // Dark Green
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
