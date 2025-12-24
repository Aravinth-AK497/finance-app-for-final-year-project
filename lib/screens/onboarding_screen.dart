import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:final_year_project/screens/dashboard_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                   Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => const DashboardScreen()),
                  );
                },
                child: Text(
                  'Skip',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            // PageView
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                children: [
                  OnboardingPage(
                    title: 'Track expenses\nautomatically',
                    subtitle: 'SmartMoney syncs with your SMS and UPI apps to categorize every rupee you spend in real-time.',
                    icon: Icons.phone_android,
                    color: Colors.teal,
                  ),
                  OnboardingPage(
                    title: 'Smart Insights',
                    subtitle: 'Decode your spending patterns with AI. See exactly where every Rupee (₹) goes.',
                    icon: Icons.analytics,
                    color: Colors.orange,
                  ),
                  OnboardingPage(
                    title: 'Plan budgets & save\nmore effortlessly',
                    subtitle: 'SmartMoney uses AI to track your daily UPI and card expenses, helping you stick to your monthly limits automatically.',
                    icon: Icons.savings,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            
            /*
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xFF1E3A8A),
                dotColor: Color(0xFFCBD5E1),
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
            */
            const Text("..."),
            
            const SizedBox(height: 32),
            
            // Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => const DashboardScreen()),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLastPage ? 'Get Started' : 'Next',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Icon(icon, size: 100, color: color),
          ),
          const SizedBox(height: 48),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E1E2D),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
