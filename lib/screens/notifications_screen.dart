import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), // Light grey
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1E1E2D),
            fontWeight: FontWeight.w600,
            fontSize: 20, // Large header
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Color(0xFF1E3A8A)),
            onPressed: () {},
          ),
          TextButton(
             onPressed: () {},
             child: Text('Mark read', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF1E3A8A))),
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
               children: [
                 _buildTab('Recent', true),
                 const SizedBox(width: 24),
                 _buildTab('Archived', false),
               ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('TODAY'),
          const SizedBox(height: 12),
          
          // Overspending Alert
          _buildNotificationCard(
            type: NotificationType.alert,
            title: 'Overspending Alert',
            time: '2h ago',
            content: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(color: const Color(0xFF64748B)),
                children: [
                  const TextSpan(text: 'You are '),
                  TextSpan(text: '₹2,500', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFFE11D48))),
                  const TextSpan(text: ' over budget in \'Dining Out\' this month.'),
                ],
              ),
            ),
            actionLabel: 'View Budget',
          ),
          const SizedBox(height: 12),

          // Bill Due
          _buildNotificationCard(
            type: NotificationType.bill,
            title: 'Electricity Bill',
            time: '4h ago',
            content: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(color: const Color(0xFF64748B)),
                children: [
                  const TextSpan(text: 'Due tomorrow from BESCOM. Amount due: '),
                  TextSpan(text: '₹1,200', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))),
                ],
              ),
            ),
            primaryAction: true,
            actionLabel: 'Pay Now',
          ),

          const SizedBox(height: 24),
          _buildSectionHeader('YESTERDAY'),
          const SizedBox(height: 12),
          
          // Weekly Summary
          _buildNotificationCard(
            type: NotificationType.summary,
            title: 'Weekly Summary',
            isSmartInsight: true,
            content: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(color: const Color(0xFF64748B)),
                children: [
                  const TextSpan(text: 'Great job! You saved '),
                  TextSpan(text: '15% more', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF22C55E))),
                  const TextSpan(text: ' than last week.'),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 12),

          // Subscription
          _buildNotificationCard(
            type: NotificationType.subscription,
            title: 'Netflix Standard',
            time: 'Yesterday',
            content: Text(
              'Renewed via UPI • ₹649',
              style: GoogleFonts.inter(color: const Color(0xFF64748B)),
            ),
          ),

          const SizedBox(height: 24),
          _buildSectionHeader('EARLIER'),
          const SizedBox(height: 12),

           _buildNotificationCard(
            type: NotificationType.system,
            title: 'Bank Sync Successful',
            time: '2 days ago',
            content: Text(
              'Bank of Baroda • Account ending in 4590',
              style: GoogleFonts.inter(color: const Color(0xFF64748B)),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isActive ? const Color(0xFF1E3A8A) : const Color(0xFF94A3B8),
          ),
        ),
        const SizedBox(height: 8),
        if (isActive)
          Container(width: 40, height: 3, color: const Color(0xFF1E3A8A)),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF64748B),
        letterSpacing: 1,
      ),
    );
  }

  Widget _buildNotificationCard({
    required NotificationType type,
    required String title,
    String? time,
    required Widget content,
    String? actionLabel,
    bool primaryAction = false,
    bool isSmartInsight = false,
  }) {
    IconData icon;
    Color iconColor;
    Color iconBg;

    switch (type) {
      case NotificationType.alert:
        icon = Icons.warning_amber_rounded;
        iconColor = const Color(0xFFE11D48);
        iconBg = const Color(0xFFFFE4E6);
        break;
      case NotificationType.bill:
        icon = Icons.receipt_long;
        iconColor = const Color(0xFF1E3A8A);
        iconBg = const Color(0xFFDBEAFE);
        break;
      case NotificationType.summary:
        icon = Icons.trending_down;
        iconColor = const Color(0xFF15803D);
        iconBg = const Color(0xFFDCFCE7);
        break;
      case NotificationType.subscription:
        icon = Icons.subscriptions;
        iconColor = const Color(0xFF1E1E2D);
        iconBg = const Color(0xFFE2E8F0);
        break;
      case NotificationType.system:
        icon = Icons.sync_alt;
        iconColor = const Color(0xFF64748B);
        iconBg = const Color(0xFFF1F5F9);
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
           BoxShadow(color: Colors.black12, blurRadius: 0, offset: Offset(0, 0), spreadRadius: 0), // Flat look/border
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D)),
                      ),
                    ),
                    if (type == NotificationType.alert)
                       Container(margin: const EdgeInsets.only(left: 8), width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFFE11D48), shape: BoxShape.circle)),

                    if (time != null)
                      Text(time, style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF94A3B8))),
                      
                     if (isSmartInsight)
                        Row(
                          children: [
                            const Icon(Icons.auto_awesome, size: 12, color: Color(0xFF3B82F6)),
                            const SizedBox(width: 4),
                            Text('SMART INSIGHT', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF3B82F6))),
                          ],
                        )
                  ],
                ),
                const SizedBox(height: 4),
                content,
                
                if (actionLabel != null) ...[
                  const SizedBox(height: 16),
                  if (primaryAction)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(actionLabel, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white)),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: 32,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFF1F5F9),
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(actionLabel, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xFF475569))),
                      ),
                    ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum NotificationType { alert, bill, summary, subscription, system }
