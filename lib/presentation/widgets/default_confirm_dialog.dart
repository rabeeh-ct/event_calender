import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class DefaultConfirmDialog extends StatelessWidget {
  const DefaultConfirmDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.loading,
    required this.onClick,
    required this.buttonText,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    this.secondButtonText,
  });
  final String title;
  final String subTitle;
  final String buttonText;
  final String? secondButtonText;
  final Color? primaryButtonColor;
  final Color? secondaryButtonColor;
  final RxBool loading;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              top: defaultPadding * 1.5,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  textScaler: TextScaler.noScaling,
                ),
                defaultSpacerSmall,
                Text(
                  subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.noScaling,
                ),
              ],
            ),
          ),
          defaultSpacer,
          SizedBox(
            height: defaultPadding * 2.5,
            child: Obx(() {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: loading.value ? null : onClick,
                  child: Container(
                    height: defaultPadding * 2.5,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: .3,
                          color: greyColor,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: loading.value
                        ? const CupertinoActivityIndicator()
                        : Text(
                            buttonText,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: primaryButtonColor,
                                ),
                            textScaler: TextScaler.noScaling,
                          ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: defaultPadding * 2.5,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(defaultPadding),
                    bottomLeft: Radius.circular(defaultPadding)),
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: defaultPadding * 2.5,
                        alignment: Alignment.center,
                        child: Text(
                          secondButtonText??"Cancel",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: secondaryButtonColor ?? primaryColor,
                              ),
                          textScaler: TextScaler.noScaling,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
