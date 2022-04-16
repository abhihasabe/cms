import 'package:cms/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatelessWidget with PreferredSizeWidget {
  const AppScaffold(
      {this.appBar, this.drawer, this.body, this.bgColor, Key? key})
      : super(key: key);

  final Widget? body;
  final Widget? appBar;
  final Widget? drawer;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Scaffold(
            key: context.read<MenuController>().scaffoldKey,
            backgroundColor: bgColor ?? Colors.white,
            appBar: appBar != null
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(56.0),
                    child: appBar!,
                  )
                : null,
            drawer: drawer,
            body: body,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
