import 'package:flutter/material.dart';
import 'package:bookstore/modules/features/root_router/assembly/root_router_assembly.dart'
    as root_router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BookstoreApp());
}

class BookstoreApp extends StatelessWidget {
  const BookstoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: root_router.Assembly().rootRouter,
    );
  }
}
