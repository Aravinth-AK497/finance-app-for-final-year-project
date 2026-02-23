import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_year_project/firebase_options.dart';
import 'package:final_year_project/screens/splash_screen.dart';
import 'package:final_year_project/services/api/api_service.dart';
import 'package:final_year_project/providers/auth_provider.dart';
import 'package:final_year_project/providers/transaction_provider.dart';
import 'package:final_year_project/providers/budget_provider.dart';
import 'package:final_year_project/providers/insight_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // This will catch the UnimplementedError from the placeholder if config is missing
    print("FIREBASE INIT FAILED: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a single ApiService instance shared by all providers
    final apiService = ApiService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(apiService),
        ),
        ChangeNotifierProvider(
          create: (_) => TransactionProvider(apiService),
        ),
        ChangeNotifierProvider(
          create: (_) => BudgetProvider(apiService),
        ),
        ChangeNotifierProvider(
          create: (_) => InsightProvider(apiService),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(apiService),
        ),
      ],
      child: MaterialApp(
        title: 'SmartMoney',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
