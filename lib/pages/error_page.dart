import 'package:cozy_app/widgets/my_text.dart';
import 'package:flutter/material.dart';

import '../extension/extensions.dart';
import '../shared/shared_value.dart';

class ErrorPage extends StatelessWidget {
  final String? errorTitle;
  final String? errorSubTitle;
  final bool useButton;

  const ErrorPage({Key? key, this.errorTitle, this.errorSubTitle, this.useButton = true})
      : super(key: key);

  void _onClickBackHome(BuildContext context) =>
      Navigator.popUntil(context, ModalRoute.withName(RouteName.homePage));

  String _errorTitle() => errorTitle ?? 'Where are you going?';

  String _errorSubTitle() =>
      errorSubTitle ??
      'Seems like the page that you were\nrequested is already gone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            top: context.h(14),
            left: context.dp(38),
            right: context.dp(38),
            bottom: context.h(36),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/error_404.png', width: context.dw),
              SizedBox(height: context.dp(70)),
              MyText(_errorTitle(),
                  style: context.text.headline6, textAlign: TextAlign.center),
              SizedBox(height: context.dp(14)),
              Text(_errorSubTitle(),
                  style: context.text.subtitle1, textAlign: TextAlign.center),
              if(useButton) SizedBox(height: context.dp(50)),
              if(useButton) ElevatedButton(
                  onPressed: () => _onClickBackHome(context),
                  child: MyText('Back to Home')),
            ],
          ),
        ),
      ),
    );
  }
}
