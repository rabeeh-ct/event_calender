import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/app_error.dart';
import 'error_with_retry.dart';

class NetworkResource extends StatelessWidget {
  const NetworkResource(
      {Key? key,
      required this.retry,
      required this.appError,
      required this.child,
      required this.loading,
      this.loadingWidget})
      : super(key: key);
  final VoidCallback retry;
  final AppError? appError;
  final Widget child;
  final Widget? loadingWidget;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ?
            // const LoadingWidget()
            loadingWidget ?? const LoadingWidget()
            : appError != null
                ? ErrorWithRetry(
                    appError: appError!,
                    retry: retry,
                  )
                : child);
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 15),
    );
  }
}
