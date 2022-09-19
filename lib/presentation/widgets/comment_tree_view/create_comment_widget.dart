import 'package:flutter/material.dart';

class CreateCommentWidget extends StatefulWidget {
  static const path = '/create_comment_widget';
  const CreateCommentWidget({Key? key}) : super(key: key);

  @override
  State<CreateCommentWidget> createState() => _CreateCommentWidgetState();
}

class _CreateCommentWidgetState extends State<CreateCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(onSaved: (v){},);
  }
}