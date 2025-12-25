import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class SpendingInsightsScreen extends StatelessWidget {
  const SpendingInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Spending Insights',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1E1E2D),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Toggle
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E3A8A),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            'This Month',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Last Month',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF64748B),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Donut Chart
              SizedBox(
                height: 250,
                width: 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(250, 250),
                      painter: DonutChartPainter(),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Total Spent',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF64748B),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '₹42,850',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1E1E2D),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE4E6), // Red 100
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.trending_up, size: 14, color: Color(0xFFE11D48)),
                              const SizedBox(width: 4),
                              Text(
                                '12% vs Sep',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFFE11D48),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // AI Insight
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFEFF6FF), width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF1E3A8A),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'SMART INSIGHT',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: const Color(0xFF1E1E2D),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDBEAFE),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'AI GENERATED',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1E3A8A),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF64748B),
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(text: 'Your '),
                          TextSpan(
                            text: 'Food & Dining',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D)),
                          ),
                          const TextSpan(text: ' expenses are '),
                          TextSpan(
                            text: '15% higher',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFFE11D48)),
                          ),
                          const TextSpan(text: ' than usual. Consider cooking at home this weekend to save approx '),
                          TextSpan(
                            text: '₹1,200',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D)),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Categories Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E1E2D),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF1E3A8A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // List
              _buildCategoryItem(Icons.restaurant, 'Food & Dining', '24 transactions', '₹14,997', 0.35, const Color(0xFFDBEAFE), const Color(0xFF1E3A8A)),
              const SizedBox(height: 16),
              _buildCategoryItem(Icons.shopping_bag, 'Shopping', '8 transactions', '₹10,712', 0.25, const Color(0xFFF3E8FF), const Color(0xFF9333EA)),
              const SizedBox(height: 16),
              _buildCategoryItem(Icons.directions_car, 'Transport', '18 transactions', '₹8,570', 0.20, const Color(0xFFE0F2FE), const Color(0xFF0284C7)),
              const SizedBox(height: 16),
              _buildCategoryItem(Icons.bolt, 'Utilities', '4 transactions', '₹8,571', 0.20, const Color(0xFFF1F5F9), const Color(0xFF64748B)),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title, String subtitle, String amount, double progress, Color bg, Color color) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bg,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: const Color(0xFF1E1E2D),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color(0xFF1E1E2D),
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: const Color(0xFFF1F5F9),
            color: color,
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 35.0;
    final rect = Rect.fromCircle(center: center, radius: radius - strokeWidth / 2);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt; // Use butt, but maybe round if spaces needed

    // Draw arcs
    double startAngle = -pi / 2;

    // Segment 1 (Blue) 35%
    paint.color = const Color(0xFF1E3A8A);
    double sweepAngle1 = 2 * pi * 0.35;
    canvas.drawArc(rect, startAngle, sweepAngle1, false, paint);
    startAngle += sweepAngle1;

    // Segment 2 (Light Blue) 25%
    paint.color = const Color(0xFF3B82F6);
    double sweepAngle2 = 2 * pi * 0.25;
    canvas.drawArc(rect, startAngle, sweepAngle2, false, paint);
    startAngle += sweepAngle2;

    // Segment 3 (Lighter Blue) 20%
    paint.color = const Color(0xFF93C5FD);
    double sweepAngle3 = 2 * pi * 0.20;
    canvas.drawArc(rect, startAngle, sweepAngle3, false, paint);
    startAngle += sweepAngle3;

    // Segment 4 (Grey/Empty?) 20%
    paint.color = const Color(0xFFDBEAFE);
    double sweepAngle4 = 2 * pi * 0.20;
    canvas.drawArc(rect, startAngle, sweepAngle4, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
