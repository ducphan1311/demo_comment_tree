import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/home/home_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/comment_list_page.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/comment_page.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/comment_page_3.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/home_page.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/web_view_page.dart';
import 'package:tips_and_tricks_flutter/utils/navigator_support.dart';

class MainNavigator extends StatefulWidget {
  static const path = '/main_navigator';
  const MainNavigator({Key? key}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc();
      },
      child: NavigatorSupport(
        initialRoute: HomePage.path,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomePage.path:
              return MaterialPageRoute(
                  builder: (context) => const HomePage());
            case CommentPage.path:
              return MaterialPageRoute(
                  builder: (context) => const CommentPage());
            case CommentListPage.path:
              return MaterialPageRoute(
                  builder: (context) => const CommentListPage());
            case WebViewPage.path:
              return MaterialPageRoute(
                  builder: (context) => const WebViewPage());
            case CommentPage3.path:
              return MaterialPageRoute(
                  builder: (context) => const CommentPage3());
            default:
              return MaterialPageRoute(builder: (context) => Container());
          }
        },
      ),
    );
  }
}
