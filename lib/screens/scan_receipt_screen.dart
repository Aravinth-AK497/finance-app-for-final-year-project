import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanReceiptScreen extends StatelessWidget {
  const ScanReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Camera bg
      body: Stack(
        children: [
          // Mock Camera View
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.transparent, Colors.black54],
              ),
            ),
            child: Center(
              child: Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                  color: Colors.white.withOpacity(0.1), // Placeholder for camera feed
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.receipt_long, size: 64, color: Colors.white54),
                    const SizedBox(height: 16),
                    Text(
                      'Align receipt within frame',
                      style: GoogleFonts.inter(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Frame Corners (Blue)
          Center(
            child: SizedBox(
               width: 320,
               height: 520,
               child: Stack(
                 children: [
                   // Top Left
                   Positioned(
                     top: 0, left: 0,
                     child: Container(width: 40, height: 40, decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFF3B82F6), width: 4), left: BorderSide(color: Color(0xFF3B82F6), width: 4), ), borderRadius: BorderRadius.only(topLeft: Radius.circular(24))))
                   ),
                   // Top Right
                   Positioned(
                     top: 0, right: 0,
                     child: Container(width: 40, height: 40, decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFF3B82F6), width: 4), right: BorderSide(color: Color(0xFF3B82F6), width: 4), ), borderRadius: BorderRadius.only(topRight: Radius.circular(24))))
                   ),
                   // Bottom Left
                   Positioned(
                     bottom: 0, left: 0,
                     child: Container(width: 40, height: 40, decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF3B82F6), width: 4), left: BorderSide(color: Color(0xFF3B82F6), width: 4), ), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24))))
                   ),
                   // Bottom Right
                   Positioned(
                     bottom: 0, right: 0,
                     child: Container(width: 40, height: 40, decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF3B82F6), width: 4), right: BorderSide(color: Color(0xFF3B82F6), width: 4), ), borderRadius: BorderRadius.only(bottomRight: Radius.circular(24))))
                   )
                 ],
               ),
            ),
          ),

          // Merchant Tag Mock
          Positioned(
             top: 250,
             left: 100,
             child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
               decoration: BoxDecoration(
                 color: const Color(0xFF6366F1),
                 borderRadius: BorderRadius.circular(4)
               ),
               child: Text('MERCHANT', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
             ), 
          ),

          // Header
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Scan Receipt',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Align receipt within frame',
                        style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon: const Icon(Icons.flash_on, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Sheet (DraggableScrollableSheet or just positioned container for mock)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40, height: 4, 
                    decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2)),
                  ),
                  const SizedBox(height: 24),
                  
                  // Status Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 20),
                          const SizedBox(width: 8),
                          Text('Data Extracted', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF22C55E))),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                           color: const Color(0xFFDBEAFE),
                           borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.translate, size: 14, color: Color(0xFF1E3A8A)),
                            const SizedBox(width: 4),
                            Text('English / Tamil', style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF1E3A8A), fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Text('Total Amount', style: GoogleFonts.inter(color: const Color(0xFF64748B))),
                  const SizedBox(height: 4),
                  Text('₹ 450.00', style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))),
                  
                  const SizedBox(height: 24),

                  _buildDetailItem(Icons.store, 'MERCHANT', 'Saravana Bhavan'),
                  Divider(height: 24, color: Colors.grey.shade200),
                  _buildDetailItem(Icons.calendar_today, 'DATE', '24 Oct 2023'),
                  Divider(height: 24, color: Colors.grey.shade200),
                  _buildDetailItem(Icons.restaurant, 'CATEGORY', 'Food & Dining', isMagic: true),

                  const SizedBox(height: 32),

                  Row(
                    children: [
                      Container(
                        width: 60, height: 60,
                        decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.refresh, color: Color(0xFF1E1E2D)),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E3A8A),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Confirm Transaction', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  Text('RETAKE', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E2D))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value, {bool isMagic = false}) {
    return Row(
      children: [
        Container(
           padding: const EdgeInsets.all(10),
           decoration: const BoxDecoration(color: Color(0xFFF1F5F9), shape: BoxShape.circle),
           child: Icon(icon, size: 20, color: const Color(0xFF1E3A8A)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8))),
              const SizedBox(height: 4),
              Text(value, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF1E1E2D))),
            ],
          ),
        ),
        if (isMagic)
           const Icon(Icons.auto_awesome, size: 18, color: Color(0xFF3B82F6))
        else
           const Icon(Icons.edit, size: 18, color: Color(0xFF94A3B8)),
      ],
    );
  }
}
