import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
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
                  top: 50,
                  left: 20,
                  child: Icon(
                    Icons.grass,
                    color: Colors.white.withOpacity(0.3),
                    size: 30,
                  ),
                ),
                Positioned(
                  top: 120,
                  right: 30,
                  child: Icon(
                    Icons.park,
                    color: Colors.white.withOpacity(0.3),
                    size: 25,
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 40,
                  child: Icon(
                    Icons.nature,
                    color: Colors.white.withOpacity(0.3),
                    size: 28,
                  ),
                ),
                Positioned(
                  bottom: 180,
                  right: 25,
                  child: Icon(
                    Icons.eco,
                    color: Colors.white.withOpacity(0.3),
                    size: 22,
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
                    // Plant Icon with decorative elements
                    Container(
                      width: 80,
                      height: 80,
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
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.eco,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // App Title with plant theme
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_florist,
                          color: Colors.green.shade600,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "FreshBite",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.local_florist,
                          color: Colors.green.shade600,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),

                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Type your username",
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
                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

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
                            Navigator.pushReplacementNamed(context, "/products");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      "Or Sign up Using",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialButton(
                          color: const Color(0xFF3B5998), // Facebook blue
                          icon: Icons.facebook,
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          color: const Color(0xFF1DA1F2), // Twitter blue
                          icon: Icons.alternate_email,
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          color: const Color(0xFFDB4437), // Google red
                          icon: Icons.g_mobiledata,
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          color: const Color(0xFF8B5CF6), // Purple gradient
                          icon: Icons.add,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/register"),
                      child: const Text("Belum punya akun? Register"),
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

class _SocialButton extends StatelessWidget {
  final Color color;
  final IconData icon;

  const _SocialButton({required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
