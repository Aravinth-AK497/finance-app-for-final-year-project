import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Very light grey
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1E1E2D),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Profile Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                 BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
              ]
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150'), 
                  // In real app use asset or file image
                  backgroundColor: Color(0xFFFFCC80),
                  child: Icon(Icons.person, size: 40, color: Color(0xFF5D4037)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rahul Sharma',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1E1E2D),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDBEAFE),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'PRO',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E3A8A),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'rahul.sharma@example.com',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                      Text(
                        '+91 98765 43210',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ),
                 Container(
                   padding: const EdgeInsets.all(8),
                   decoration: const BoxDecoration(
                     color: Color(0xFFF1F5F9),
                     shape: BoxShape.circle,
                   ),
                   child: const Icon(Icons.edit, size: 16, color: Color(0xFF64748B)),
                 )
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          _buildSectionTitle('PREFERENCES'),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(20),
            ),
             child: Column(
               children: [
                 _buildSettingItem(
                   icon: Icons.translate,
                   iconColor: const Color(0xFF6366F1),
                   title: 'Language',
                   trailing: _buildTrailingText('English'),
                 ),
                 _buildDivider(),
                 _buildSettingItem(
                   icon: Icons.currency_rupee,
                   iconColor: const Color(0xFF22C55E),
                   title: 'Currency',
                   trailing: _buildTrailingText('INR (₹)'),
                 ),
                 _buildDivider(),
                 _buildSettingItem(
                   icon: Icons.dark_mode,
                   iconColor: const Color(0xFF1E1E2D),
                   title: 'Dark Mode',
                   trailing: Switch(value: false, onChanged: (v){}, activeColor: const Color(0xFF1E3A8A)),
                 ),
               ],
             ),
          ),

          const SizedBox(height: 32),
          
          _buildSectionTitle('FINANCE & AI'),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(20),
            ),
             child: Column(
               children: [
                 _buildSettingItem(
                   icon: Icons.category,
                   iconColor: const Color(0xFFE11D48),
                   title: 'Expense Categories',
                   trailing: const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
                 ),
                 _buildDivider(),
                 _buildSettingItem(
                   icon: Icons.sms,
                   iconColor: const Color(0xFF1E3A8A),
                   title: 'Auto-Track via SMS',
                   subtitle: 'AI safely reads transaction SMS to automatically log expenses. Your data stays on your device.',
                   trailing: Switch(value: true, onChanged: (v){}, activeColor: const Color(0xFF1E3A8A)),
                 ),
                 _buildDivider(),
                  _buildSettingItem(
                   icon: Icons.account_balance_wallet,
                   iconColor: const Color(0xFFF59E0B),
                   title: 'Monthly Budget',
                   trailing: _buildTrailingText('₹25,000'),
                 ),
               ],
             ),
          ),

          const SizedBox(height: 32),
          
           _buildSectionTitle('SECURITY & SUPPORT'),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(20),
            ),
             child: Column(
               children: [
                 _buildSettingItem(
                   icon: Icons.face,
                   iconColor: const Color(0xFF3B82F6),
                   title: 'FaceID App Lock',
                   trailing: Switch(value: false, onChanged: (v){}, activeColor: const Color(0xFF1E3A8A)),
                 ),
                 _buildDivider(),
                 _buildSettingItem(
                   icon: Icons.help,
                   iconColor: const Color(0xFF8B5CF6),
                   title: 'Help & Support',
                   trailing: const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
                 ),
                 _buildDivider(),
                  _buildSettingItem(
                   icon: Icons.privacy_tip,
                   iconColor: const Color(0xFF475569),
                   title: 'Privacy Policy',
                   trailing: const Icon(Icons.open_in_new, size: 16, color: Color(0xFF94A3B8)),
                 ),
               ],
             ),
          ),

          const SizedBox(height: 32),
          
          TextButton.icon(
             onPressed: () {},
             icon: const Icon(Icons.logout, color: Color(0xFFDC2626)),
             label: Text('Log Out', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFFDC2626))),
             style: TextButton.styleFrom(
               backgroundColor: const Color(0xFFFEF2F2),
               padding: const EdgeInsets.symmetric(vertical: 16),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
             ),
          ),

           const SizedBox(height: 24),
           
           Center(child: Text('SmartMoney v2.4.1 (Build 204)', style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF94A3B8)))),
           const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
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

  Widget _buildSettingItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    required Widget trailing,
  }) {
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
       child: Row(
         children: [
            Container(
               padding: const EdgeInsets.all(8),
               decoration: BoxDecoration(
                 color: iconColor,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                      title,
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal, color: const Color(0xFF1E1E2D)),
                   ),
                   if (subtitle != null) ...[
                     const SizedBox(height: 4),
                      Text(
                      subtitle,
                      style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B), height: 1.4),
                   ),
                   ]
                ],
              ),
            ),
            const SizedBox(width: 8),
            trailing,
         ],
       ),
    );
  }

  Widget _buildTrailingText(String text) {
    return Row(
      children: [
        Text(text, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF64748B))),
        const SizedBox(width: 8),
        const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, indent: 64, endIndent: 0, color: Color(0xFFF1F5F9));
  }
}
