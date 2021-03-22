import 'package:flutter/material.dart';

import '../widget/my_dialog.dart';

class MyDialogHelper {
  static dialog(context) =>
      showDialog(context: context, builder: (context) => MyDialog());
}
