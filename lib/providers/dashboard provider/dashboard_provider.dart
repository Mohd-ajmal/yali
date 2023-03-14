import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  // --------------------------------------------------------- Getters -----------------------------------------------------------------

  int get value => _value;

  // --------------------------------------------------------- Variables ---------------------------------------------------------------

  int _value = 0;

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
  
}
