import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});

final String email;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (kDebugMode) {
            print(email);
          }
        },
        child: Text(email),
      ),
    );
  }
}
