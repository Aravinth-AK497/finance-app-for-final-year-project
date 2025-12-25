import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionInsightScreen extends StatelessWidget {
  const TransactionInsightScreen({super.key});

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
          'Transaction Insight',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1E1E2D),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
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
              // Original SMS Label
              Row(
                children: [
                  const Icon(Icons.message, size: 16, color: Color(0xFF1E3A8A)),
                  const SizedBox(width: 8),
                  Text(
                    'ORIGINAL SMS SOURCE',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E3A8A),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // SMS Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text.rich(
                  TextSpan(
                    text: 'Sent ',
                    style: GoogleFonts.sourceCodePro(
                      color: const Color(0xFF64748B),
                      fontSize: 14,
                      height: 1.5,
                    ),
                    children: [
                      WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDBEAFE),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Rs. 1,249.00',
                            style: GoogleFonts.sourceCodePro(
                              color: const Color(0xFF1E3A8A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: ' to '),
                      WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDBEAFE),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'AMAZON PAY INDIA',
                            style: GoogleFonts.sourceCodePro(
                              color: const Color(0xFF1E3A8A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: ' via UPI. Ref No 3294819922. 25 Oct, 04:30 PM. Avl Bal Rs 12,450.00.'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // AI Badge
              Row(
                children: [
                   Container(
                     padding: const EdgeInsets.all(6),
                     decoration: const BoxDecoration(
                       color: Color(0xFF1E3A8A),
                       shape: BoxShape.circle,
                     ),
                     child: const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                   ),
                   const SizedBox(width: 8),
                   Text(
                     'SmartMoney AI',
                     style: GoogleFonts.poppins(
                       fontSize: 16,
                       fontWeight: FontWeight.w600,
                       color: const Color(0xFF1E1E2D),
                     ),
                   ),
                   const Spacer(),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                     decoration: BoxDecoration(
                       color: const Color(0xFFDCFCE7),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Row(
                       children: [
                         const Icon(Icons.check_circle, color: Color(0xFF16A34A), size: 14),
                         const SizedBox(width: 4),
                         Text(
                           '98% Confidence',
                           style: GoogleFonts.inter(
                             fontSize: 12,
                             color: const Color(0xFF166534),
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ],
                     ),
                   ),
                ],
              ),

              const SizedBox(height: 20),

              // Amount Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text(
                      'Amount Detected',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF64748B),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: '₹1,249',
                        style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E3A8A),
                        ),
                        children: [
                          TextSpan(
                            text: '.00',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Merchant
              _buildEditableCard(
                'MERCHANT',
                'Amazon Pay',
                Icons.shopping_cart,
                const Color(0xFFFFF7ED),
                Colors.orange,
              ),

              const SizedBox(height: 16),

              // Category
              _buildEditableCard(
                'CATEGORY',
                'Online Shopping',
                Icons.shopping_bag,
                const Color(0xFFEFF6FF),
                Colors.blue,
                isDropdown: true,
              ),

              const SizedBox(height: 16),

              // Info Row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('METHOD', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8))),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.account_balance, color: Color(0xFF1E3A8A), size: 20),
                              const SizedBox(width: 8),
                              Text('UPI', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DATE', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8))),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: const Color(0xFF1E3A8A), size: 18),
                              const SizedBox(width: 8),
                              Text('25 Oct', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // AI disclaimer
              Container(
                 padding: const EdgeInsets.all(12),
                 decoration: BoxDecoration(
                   color: const Color(0xFFEFF6FF),
                   borderRadius: BorderRadius.circular(16),
                   border: Border.all(color: const Color(0xFFDBEAFE)),
                 ),
                 child: Row(
                   children: [
                     const Icon(Icons.info_outline, color: Color(0xFF1E3A8A), size: 16),
                     const SizedBox(width: 8),
                     Expanded(
                       child: Text(
                         'SmartMoney AI identified this transaction automatically.',
                         style: GoogleFonts.inter(
                           fontSize: 12,
                           color: const Color(0xFF1E3A8A),
                         ),
                       ),
                     )
                   ],
                 ),
              ),

              const SizedBox(height: 100), // Spacing for fab/bottom buttons
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
             BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, -5))
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      'Confirm Transaction',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  'Edit Details Manually',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableCard(String label, String value, IconData icon, Color bg, Color iconColor, {bool isDropdown = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bg,
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
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E1E2D),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isDropdown ? Icons.keyboard_arrow_down : Icons.edit,
              color: const Color(0xFF64748B),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
