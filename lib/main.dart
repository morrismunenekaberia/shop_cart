import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shop_app/core/config.dart';
import 'package:shop_app/core/supabase_client.dart';
import 'package:shop_app/core/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY, // ignore: deprecated_member_use
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Temporary connection test - to be removed in section 5
  late final Future<String?> _connectionTestFuture;

  @override
  void initState() {
    super.initState();
    _connectionTestFuture = _testSupabaseConnection();
  }

  // Temporary connection test - to be removed in section 5
  Future<String?> _testSupabaseConnection() async {
    try {
      await supabase.from('products').select('id').limit(1);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Shop App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Temporary connection test - to be removed in section 5
              FutureBuilder<String?>(
                future: _connectionTestFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Connecting...');
                  }
                  final error = snapshot.data;
                  if (snapshot.hasError || error != null) {
                    final message = error ?? snapshot.error.toString();
                    return Text(
                      'Not connected: $message',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    );
                  }
                  return const Text(
                    'Connected',
                    style: TextStyle(color: Colors.green),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
