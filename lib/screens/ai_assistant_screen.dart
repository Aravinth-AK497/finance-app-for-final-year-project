import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // No shadow for clean look
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Text(
              'SmartMoney Assistant',
              style: GoogleFonts.poppins(
                color: const Color(0xFF1E1E2D),
                fontWeight: FontWeight.w600,
                fontSize: 16, // Matching header size
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF22C55E), // Green online status
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'Online',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF94A3B8), // Grey text
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Date Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0), // Grey 200
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Today, 10:23 AM',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF64748B), // Slate 500
                ),
              ),
            ),
          ),

          // Message List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildAiMessage(
                  "Namaste! 🙏 I’m your personal finance assistant. How can I help you save money today?",
                ),
                _buildUserMessage("How much did I spend on Zomato this week?"),
                _buildAiMessage(
                  "You've spent ₹1,250 on food delivery this week. That’s 10% lower than last week! 📉",
                ),
                
                const SizedBox(height: 16),
                
                // Weekly Spend Card
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(right: 48), // Indent like AI message
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'WEEKLY SPEND',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF94A3B8),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCFCE7), // Green 100
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.trending_down, size: 12, color: Color(0xFF16A34A)),
                                const SizedBox(width: 4),
                                Text(
                                  '10%',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF16A34A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '₹1,250',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E1E2D),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Mock Bar Chart
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildMockBar(60, const Color(0xFFE2E8F0)), // Grey bar
                          const SizedBox(width: 12),
                          _buildMockBar(40, const Color(0xFF1E3A8A)), // Blue bar
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Suggestion Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildSuggestionChip(Icons.show_chart, 'Predict next month'),
                const SizedBox(width: 12),
                _buildSuggestionChip(null, 'Set a food budget'),
                const SizedBox(width: 12),
                _buildSuggestionChip(null, 'Show food expenses'),
              ],
            ),
          ),

          // Input Bar
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24), // Extra bottom padding for safe area
            decoration: const BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
               boxShadow: [
                 BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))
               ]
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                   decoration: const BoxDecoration(
                     color: Color(0xFFF1F5F9),
                     shape: BoxShape.circle,
                   ),
                   child: const Icon(Icons.add, color: Color(0xFF64748B)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ask anything about your finances...',
                        hintStyle: GoogleFonts.inter(color: const Color(0xFF94A3B8)),
                        border: InputBorder.none,
                        suffixIcon: const Icon(Icons.mic, color: Color(0xFF64748B)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                 Container(
                  padding: const EdgeInsets.all(12),
                   decoration: const BoxDecoration(
                     color: Color(0xFF1E3A8A),
                     shape: BoxShape.circle,
                   ),
                   child: const Icon(Icons.send, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiMessage(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, right: 48.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI Avatar
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFF1E1E2D), // Dark background
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.smart_toy, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 12),
          // Bubble
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SmartMoney AI',
                  style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF94A3B8)),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    text,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      height: 1.5,
                      color: const Color(0xFF1E1E2D),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserMessage(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, left: 48.0), // Indent from left
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF1E3A8A), // User Blue
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMockBar(double height, Color color) {
    return Container(
      width: 60, 
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
    );
  }

  Widget _buildSuggestionChip(IconData? icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: const Color(0xFF1E3A8A)),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: GoogleFonts.inter(
              color: const Color(0xFF1E1E2D),
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
