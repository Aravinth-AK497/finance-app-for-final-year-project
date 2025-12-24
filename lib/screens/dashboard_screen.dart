import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:final_year_project/screens/transactions_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning, Rahul',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1E1E2D),
                              ),
                            ),
                            Text(
                              '✨ Spending 15% less this week!',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: const Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Stack(
                        children: [
                          Icon(Icons.notifications_outlined, color: Colors.black),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Spending Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'OCTOBER SPENDING',
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.trending_up, color: Colors.white, size: 14),
                                SizedBox(width: 4),
                                Text(
                                  '+12%',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: '₹42,300',
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: ' / ₹60k',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '70% used',
                            style: TextStyle(color: Colors.blueAccent, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '₹17,700 remaining',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: Color(0xFF172554),
                          color: Colors.blueAccent,
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'You\'re on track to save ₹5,000 this month! 🎉',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Warning Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED), // Orange 50
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFFFEDD5)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFE4E6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Budget Exceeded',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  'View',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'You\'ve used 90% of your Dining budget. Consider cooking at home this weekend.',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: const Color(0xFF64748B),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Quick Access
                Text(
                  'Quick Access',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E1E2D),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuickAction(Icons.restaurant, 'Food', Colors.orange),
                    _buildQuickAction(Icons.flight, 'Travel', Colors.blue),
                    _buildQuickAction(Icons.qr_code_scanner, 'Scan & Pay', Colors.green),
                    _buildQuickAction(Icons.receipt_long, 'Bills', Colors.purple),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // Weekly Activity Chart
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weekly Activity',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1E1E2D),
                            ),
                          ),
                          Container(
                             padding: const EdgeInsets.all(4),
                             decoration: BoxDecoration(
                               color: const Color(0xFFF1F5F9),
                               borderRadius: BorderRadius.circular(8),
                             ),
                             child: Row(
                               children: [
                                 Container(
                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(6),
                                     boxShadow: [
                                       BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
                                     ]
                                   ),
                                   child: const Text('Week', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                 ),
                                 const SizedBox(width: 8),
                                 const Text('Month', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                 const SizedBox(width: 8),
                               ],
                             ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 200,
                        child: Container(
                        height: 200, 
                        color: Colors.blue.withOpacity(0.1), 
                        child: const Center(child: Text("Chart Placeholder")),
                      ),
                      /*
                        child: LineChart(
                          LineChartData(
                            gridData: const FlGridData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const style = TextStyle(color: Color(0xFF94A3B8), fontSize: 12);
                                    String text;
                                    switch (value.toInt()) {
                                      case 0: text = 'Mon'; break;
                                      case 1: text = 'Tue'; break;
                                      case 2: text = 'Wed'; break;
                                      case 3: text = 'Thu'; break;
                                      case 4: text = 'Fri'; break;
                                      case 5: text = 'Sat'; break;
                                      case 6: text = 'Sun'; break;
                                      default: return Container();
                                    }
                                    return SideTitleWidget(axisSide: meta.axisSide, child: Text(text, style: style));
                                  },
                                ),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            minX: 0,
                            maxX: 6,
                            minY: 0,
                            maxY: 6,
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 1),
                                  FlSpot(1, 3),
                                  FlSpot(2, 2),
                                  FlSpot(3, 2),
                                  FlSpot(4, 5),
                                  FlSpot(5, 3),
                                  FlSpot(6, 4),
                                ],
                                isCurved: true,
                                color: const Color(0xFF1E3A8A),
                                barWidth: 4,
                                isStrokeCapRound: true,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: const Color(0xFF1E3A8A).withOpacity(0.1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        */
                      ),
                    ],
                  ),
                ),
                
                 const SizedBox(height: 32),
                 
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                        'Recent Transactions',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E1E2D),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TransactionsScreen()),
                          );
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1E3A8A),
                          ),
                        ),
                      ),
                   ],
                 ),
                 
                 const SizedBox(height: 16),
                 
                 _buildTransactionItem('Starbucks', 'Food & Drink • Today, 9:41 AM', '-₹350', Icons.coffee, Colors.green),
                 const SizedBox(height: 12),
                 _buildTransactionItem('Uber Ride', 'Transport • Yesterday', '-₹120', Icons.directions_car, Colors.black),
                 const SizedBox(height: 12),
                 _buildTransactionItem('Salary Credit', 'Income • 1 Oct', '+₹85,000', Icons.account_balance_wallet, Colors.blue),
                 
                 const SizedBox(height: 80), // Fab space
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 160,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF1E3A8A),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add, color: Colors.white),
              const SizedBox(width: 8),
              Text('Add Expense', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
             boxShadow: [
               BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
             ]
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B), fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String subtitle, String amount, IconData icon, Color color) {
    final isPositive = amount.startsWith('+');
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D)),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B)),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.inter(
              fontSize: 16, 
              fontWeight: FontWeight.bold, 
              color: isPositive ? Colors.green : const Color(0xFF1E1E2D)
            ),
          ),
        ],
      ),
    );
  }
}
