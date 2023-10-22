import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green.shade400,
              child: const Icon(
                Icons.check,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Task added successfully",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
