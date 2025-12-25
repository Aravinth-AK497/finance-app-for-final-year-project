import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetManagementScreen extends StatelessWidget {
  const BudgetManagementScreen({super.key});

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
          'Budget Management',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1E1E2D),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Month Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.chevron_left, color: Colors.grey),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16, color: Color(0xFF1E1E2D)),
                        const SizedBox(width: 8),
                        Text(
                          'October 2023',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1E1E2D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
              
              const SizedBox(height: 24),

              // Overview Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
                  ]
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Remaining', style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 14)),
                            const SizedBox(height: 4),
                            Text(
                              '₹17,550', 
                              style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('TOTAL BUDGET', style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('₹50,000', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Progress
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('65% Spent', style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B))),
                        Text('₹32,450 spent', style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.65,
                        backgroundColor: const Color(0xFFF1F5F9),
                        color: const Color(0xFF1E3A8A),
                        minHeight: 12,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.trending_up, size: 16, color: Color(0xFF22C55E)),
                        const SizedBox(width: 4),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'You are on track to save ',
                              style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B)),
                              children: [
                                TextSpan(text: '₹2,400', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF15803D))),
                                const TextSpan(text: ' this month.'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Smart Insight
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                               padding: const EdgeInsets.all(8),
                               decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                               child: const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                            ),
                            const SizedBox(width: 12),
                            Text('Smart Insight', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(4)),
                          child: Text('NEW', style: GoogleFonts.inter(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your Food & Dining budget seems too low based on your spending history. We suggest increasing it by ₹2,000.',
                      style: GoogleFonts.inter(color: Colors.white.withOpacity(0.8), fontSize: 13, height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text('Apply Change'),
                        ),
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: () {},
                          child: Text('Dismiss', style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))),
                  TextButton(onPressed: () {}, child: const Text('Edit')),
                ],
              ),
              const SizedBox(height: 16),

              _buildBudgetRow(Icons.restaurant, 'Food & Dining', '₹8,500', '₹12,000', 0.70, Colors.orange, const Color(0xFFFFF7ED)),
              const SizedBox(height: 16),
              _buildBudgetRow(Icons.directions_car, 'Transport', '₹4,800', '₹5,000', 0.96, Colors.red, const Color(0xFFFEF2F2), isCritical: true),
              const SizedBox(height: 16),
              _buildBudgetRow(Icons.shopping_bag, 'Shopping', '₹3,200', '₹10,000', 0.32, Colors.purple, const Color(0xFFF3E8FF)),

              const SizedBox(height: 32),

              // Alert Toggle
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Color(0xFFEFF6FF), shape: BoxShape.circle),
                      child: const Icon(Icons.notifications_active, color: Color(0xFF1E3A8A)),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Budget Alerts', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))),
                          Text('Notify when 80% limit is reached', style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B))),
                        ],
                      ),
                    ),
                    Switch(
                      value: true, 
                      onChanged: (val) {},
                      activeColor: const Color(0xFF1E3A8A),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF1E3A8A),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text('Create Budget', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white)),
      ),
    );
  }

  Widget _buildBudgetRow(IconData icon, String title, String spent, String total, double progress, Color color, Color bg, {bool isCritical = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isCritical ? Border.all(color: Colors.red.shade100, width: 1.5) : null,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))),
              ),
              Text('$spent ', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))),
              Text('/ $total', style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFF1F5F9),
              color: color,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isCritical) 
                 Text('${(progress * 100).toInt()}% used (Critical)', style: GoogleFonts.inter(fontSize: 10, color: Colors.red, fontWeight: FontWeight.bold))
              else
                 Text('${(progress * 100).toInt()}% used', style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF64748B))),
              
              if (isCritical)
                 Text('Only ₹200 left', style: GoogleFonts.inter(fontSize: 10, color: Colors.red, fontWeight: FontWeight.bold))
              else
                 Text('₹3,500 left', style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF64748B))), // Hardcoded logic for demo
            ],
          ),
        ],
      ),
    );
  }
}
