import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_year_project/widgets/add_transaction_sheet.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  // Initial Hardcoded Data simulating a real state
  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Starbucks Coffee',
      'subtitle': '10:30 AM • Apple Pay',
      'amount': -5.40,
      'type': 'Expense',
      'category': 'Food',
      'date': DateTime.now().subtract(const Duration(hours: 4)),
    },
    {
      'title': 'Uber Ride',
      'subtitle': '08:45 AM • Visa ••4242',
      'amount': -24.50,
      'type': 'Expense',
      'category': 'Transport',
      'date': DateTime.now().subtract(const Duration(hours: 6)),
    },
    {
      'title': 'Freelance Project',
      'subtitle': 'Yesterday • Bank Transfer',
      'amount': 1200.00,
      'type': 'Income',
      'category': 'Work',
      'date': DateTime.now().subtract(const Duration(days: 1)),
    },
     {
      'title': 'Whole Foods Market',
      'subtitle': 'Yesterday • Apple Pay',
      'amount': -80.00,
      'type': 'Expense',
      'category': 'Shopping',
      'date': DateTime.now().subtract(const Duration(days: 1)),
    },
  ];

  void _addNewTransaction() async {
    final newTransaction = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => const AddTransactionSheet(),
    );

    if (newTransaction != null) {
      setState(() {
        final amount = newTransaction['amount'] as double;
        final isExpense = newTransaction['type'] == 'Expense';
        
        _transactions.insert(0, {
          'title': newTransaction['title'],
          'subtitle': 'Just now • Cash', // Placeholder for subtitle logic
          'amount': isExpense ? -amount : amount,
          'type': newTransaction['type'],
          'category': newTransaction['category'],
          'date': DateTime.now(),
        });
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Transaction Added: ${newTransaction['title']}'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFF1E3A8A),
          ),
        );
      }
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Food': return Icons.restaurant;
      case 'Transport': return Icons.directions_car;
      case 'Work': return Icons.work;
      case 'Shopping': return Icons.shopping_cart;
      case 'Entertainment': return Icons.movie;
      case 'Health': return Icons.medical_services;
      default: return Icons.category;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Food': return Colors.blue;
      case 'Transport': return Colors.lightBlue;
      case 'Work': return Colors.green;
      case 'Shopping': return Colors.purple;
      case 'Entertainment': return Colors.orange;
      case 'Health': return Colors.red;
      default: return Colors.grey;
    }
  }

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

            // Summary (Static for now, but could be dynamic)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Recent Transactions',
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _transactions.length,
                itemBuilder: (ctx, index) {
                  final tx = _transactions[index];
                  final isPositive = (tx['amount'] as double) > 0;
                  final categoryColor = _getCategoryColor(tx['category']);
                  final formattedAmount = isPositive 
                      ? '+\$${(tx['amount'] as double).abs().toStringAsFixed(2)}' 
                      : '-\$${(tx['amount'] as double).abs().toStringAsFixed(2)}';

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: _buildTransactionItem(
                      tx['title'], 
                      tx['subtitle'], 
                      formattedAmount, 
                      _getCategoryIcon(tx['category']), 
                      categoryColor.withOpacity(0.2), 
                      categoryColor, 
                      isPositive: isPositive
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTransaction,
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
