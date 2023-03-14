import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  // ------------------------------------------------------ Getters --------------------------------------------------------

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _password;

  // ------------------------------------------------------ Variables ------------------------------------------------------

  final _emailController = TextEditingController();
  final _password = TextEditingController();

  final _successSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Well!',
      message: 'Account logged in successfully',
      contentType: ContentType.success,
    ),
  );

  final _failureSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Oh Snap!',
      message: 'Account logged in successfully',
      contentType: ContentType.success,
    ),
  );

  // ------------------------------------------------------ Functionality --------------------------------------------------

  showSuccessSnackBar({required BuildContext context, required msg}) {
    return ScaffoldMessenger.of(context).showSnackBar(_successSnackBar);
  }

  showFailureSnackBar({required BuildContext context, required msg}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Oh Snap!',
        message: msg,
        contentType: ContentType.failure,
      ),
    ));
  }

  String? emailValidation({required value}){
    if(value == null){
      return "Field can't be empty";
    } else if(value.isEmpty){
      return "Field can't be empty";
    } else {
      return null;
    }
  }
}
