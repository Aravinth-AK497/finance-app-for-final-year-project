import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: Text(
          'Transactions',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 24, color: const Color(0xFF1E1E2D)),
        ),
        backgroundColor: const Color(0xFFF5F5F7),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
                  ]
                ),
                child: Row(
                  children: [
                    Expanded(child: _buildTab('All', true)),
                    Expanded(child: _buildTab('Income', false)),
                    Expanded(child: _buildTab('Expense', false)),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'October 2023',
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D)),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.keyboard_arrow_down, size: 20),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: const Text('Total: -\$2,450.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                     _buildCategoryChip('All Categories', true, Icons.category),
                     const SizedBox(width: 12),
                     _buildCategoryChip('Food', false, Icons.restaurant),
                     const SizedBox(width: 12),
                     _buildCategoryChip('Transport', false, Icons.directions_car),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildDateHeader('TODAY', '-\$29.90'),
                  const SizedBox(height: 12),
                  _buildTransactionItem('Starbucks Coffee', '10:30 AM • Apple Pay', '- \$5.40', Icons.coffee, Colors.blue.shade100, Colors.blue),
                  const SizedBox(height: 12),
                  _buildTransactionItem('Uber Ride', '08:45 AM • Visa ••4242', '- \$24.50', Icons.directions_bus, Colors.lightBlue.shade100, Colors.lightBlue),
                  
                  const SizedBox(height: 24),
                  
                  _buildDateHeader('YESTERDAY', '+\$1,120.00'),
                  const SizedBox(height: 12),
                  _buildTransactionItem('Freelance Project', '09:00 AM • Bank Transfer', '+\$1,200.00', Icons.work, Colors.green.shade100, Colors.green, isPositive: true),
                  const SizedBox(height: 12),
                  _buildTransactionItem('Whole Foods Market', '06:30 PM • Apple Pay', '- \$80.00', Icons.shopping_cart, Colors.purple.shade100, Colors.purple),
                  
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF3B82F6), // Brighter Blue
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildTab(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1E3A8A) : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String text, bool isActive, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1E3A8A) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isActive ? Colors.transparent : Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: isActive ? Colors.white : const Color(0xFF64748B)),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: isActive ? Colors.white : const Color(0xFF64748B), fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String date, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(date, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF94A3B8), fontSize: 12)),
        Container(
           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
           decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
          child: Text(amount, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF64748B), fontSize: 12)),
        )
      ],
    );
  }

  Widget _buildTransactionItem(String title, String subtitle, String amount, IconData icon, Color bgColor, Color iconColor, {bool isPositive = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4)),
        ]
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D)),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8)),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.inter(
              fontSize: 16, 
              fontWeight: FontWeight.bold, 
              color: isPositive ? Colors.green : Colors.red
            ),
          ),
        ],
      ),
    );
  }
}
