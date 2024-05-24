import 'package:flutter/material.dart';

import '../../domain/entities/app_error.dart';

class ErrorWithRetry extends StatelessWidget {
  const ErrorWithRetry({super.key, required this.appError, required this.retry});
  final AppError appError;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(appError.errorMessage(), textScaleFactor: 1.0),
          IconButton(
            onPressed: retry,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
