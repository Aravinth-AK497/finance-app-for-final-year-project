import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:final_year_project/providers/auth_provider.dart';
import 'package:final_year_project/screens/dashboard_screen.dart';
import 'package:final_year_project/utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSignUp = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    bool success;

    if (_isSignUp) {
      success = await authProvider.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phone: _phoneController.text.trim().isNotEmpty
            ? _phoneController.text.trim()
            : null,
      );
    } else {
      success = await authProvider.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }

    if (success && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else if (mounted && authProvider.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.error!),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3A8A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'SmartMoney',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Hero Image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF1E3A8A).withOpacity(0.8),
                        Colors.greenAccent.withOpacity(0.5),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Icon(Icons.trending_up, size: 80, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isSignUp ? 'Create your\naccount.' : 'Master your money\nwith AI.',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: const Color(0xFF1E1E2D),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isSignUp
                          ? 'Sign up to start tracking expenses.'
                          : 'Track expenses and grow savings effortlessly.',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: const Color(0xFF64748B),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Name field (only for sign up)
                    if (_isSignUp) ...[
                      _buildLabel('Full Name'),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _nameController,
                        hint: 'John Doe',
                        icon: Icons.person_outline,
                        validator: Validators.name,
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Email field
                    _buildLabel('Email Address'),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _emailController,
                      hint: 'you@example.com',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                    ),

                    const SizedBox(height: 16),

                    // Password field
                    _buildLabel('Password'),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _passwordController,
                      hint: '••••••••',
                      icon: Icons.lock_outline,
                      obscureText: true,
                      validator: Validators.password,
                    ),

                    // Phone field (only for sign up)
                    if (_isSignUp) ...[
                      const SizedBox(height: 16),
                      _buildLabel('Phone (Optional)'),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _phoneController,
                        hint: '9876500000',
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        validator: Validators.phone,
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Submit button
                    Consumer<AuthProvider>(
                      builder: (context, auth, _) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: auth.isLoading ? null : _handleSubmit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E3A8A),
                              disabledBackgroundColor: const Color(0xFF1E3A8A).withOpacity(0.6),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: auth.isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _isSignUp ? 'Create Account' : 'Sign In',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward,
                                          color: Colors.white, size: 20),
                                    ],
                                  ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Toggle sign up / login
                    Center(
                      child: TextButton(
                        onPressed: () => setState(() => _isSignUp = !_isSignUp),
                        child: RichText(
                          text: TextSpan(
                            text: _isSignUp
                                ? 'Already have an account? '
                                : "Don't have an account? ",
                            style: GoogleFonts.inter(
                              color: const Color(0xFF64748B),
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: _isSignUp ? 'Sign In' : 'Sign Up',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF1E3A8A),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Center(
                      child: Text(
                        'By continuing, you agree to our Terms of Service & Privacy Policy.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF64748B),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: Colors.grey.shade400),
        prefixIcon: Icon(icon, color: const Color(0xFF94A3B8), size: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF1E1E2D),
      ),
    );
  }
}
