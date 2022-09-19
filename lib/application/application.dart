import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tips_and_tricks_flutter/application/services/local_service.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_state.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/home/home_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/home_page.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/login_page.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/navigator/auth_navigator.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/navigator/main_navigator.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/splash_page.dart';

class Application extends StatefulWidget {
  static const path = 'Application';
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      home: BlocBuilder<AuthNavigationBloc, AuthNavigationState>(
        bloc: context.read<AuthNavigationBloc>(),
        builder: (context, state) {
        return state.when(
            authorized: () => MainNavigator(),
            unAuthorized: () => AuthNavigator(),
            guestMode: () => MainNavigator(),
            loadConfig: () => SplashPage(initializeApp: (context) async {
              if (GetIt.instance.get<LocalService>().isAuthorized()) {
                    return AuthNavigationState.authorized();
                  } else {
                    return AuthNavigationState.guestMode();
                  }
                }));
      },
        buildWhen: (stateOld, stateCurrent) {
          return stateOld.runtimeType != stateCurrent.runtimeType;
        },),
    );
  }
}
class _DarkConfigColor {
  static const Color _primary_01 = Color(0XFF172150);
  static const Color _primary_02 = Color(0XFF0749AC);
  static const Color _primary_03 = Color(0XFF0067B6);
  static const Color _primary_04 = Color(0XFF108CCF);
  static const Color _primary_05 = Color.fromRGBO(7, 73, 172, 0.6);

  static const Color _secondary_01 = Color(0XFF0DA79F);
  static const Color _secondary_02 = Color(0XFF2DEBE1);
  static const Color _secondary_03 = Color(0XFF6FFFF7);
  static const Color _secondary_04 = Color(0XFFACFFFA);

  static const Color _up = Color(0XFF33D49D);
  static const Color _down = Color(0XFFFE5050);
  static const Color _ceil = Color(0XFFBB6BD9);
  static const Color _floor = Color(0XFF3EAEFF);
  static const Color _ref = Color(0XFFFFA23A);

  static const Color _line_01 = Color(0XFFDBDEE1);
  static const Color _line_02 = Color(0XFFE2E8F0);

  static const Color _background_01 = Color(0XFF000512);
  static const Color _background_02 = Color(0XFF1E212C);
  static const Color _background_03 = Color(0XFFF0F0F0);
  static const Color _background_04 = Color(0XFFF0F0F0);
  static const Color _background_05 = Color(0XFFFCFCFC);
  static const Color _background_06 = Color(0XFFFFFFFF);

  static const Color _text_01 = Color(0XFF1A202C);
  static const Color _text_02 = Color(0XFF2D3748);
  static const Color _text_03 = Color(0XFF4A5568);
  static const Color _text_04 = Color(0XFF718096);
  static const Color _text_05 = Color(0XFFA0AEC0);
  static const Color _text_06 = Color(0XFFCBD5E0);
  static const Color _text_07 = Color(0XFFE2E8F0);
  static const Color _text_08 = Color(0XFFEDF2F7);
  static const Color _text_09 = Color(0XFFF7FAFC);
  static const Color _text_10 = Color(0XFFFAFAFA);
}


class CommonStyles extends ThemeExtension<CommonStyles> {
  final Color? primary_01;
  final Color? primary_02;
  final Color? primary_03;
  final Color? primary_04;
  final Color? primary_05;

  final Color? secondary_01;
  final Color? secondary_02;
  final Color? secondary_03;
  final Color? secondary_04;

  final Color? up;
  final Color? down;
  final Color? ceil;
  final Color? floor;
  final Color? ref;

  final Color? line_01;
  final Color? line_02;

  final Color? background_01;
  final Color? background_02;
  final Color? background_03;
  final Color? background_04;
  final Color? background_05;
  final Color? background_06;

  final Color? text_01;
  final Color? text_02;
  final Color? text_03;
  final Color? text_04;
  final Color? text_05;
  final Color? text_06;
  final Color? text_07;
  final Color? text_08;
  final Color? text_09;
  final Color? text_10;

  const CommonStyles({
    this.primary_01,
    this.primary_02,
    this.primary_03,
    this.primary_04,
    this.primary_05,
    this.secondary_01,
    this.secondary_02,
    this.secondary_03,
    this.secondary_04,
    this.up,
    this.down,
    this.ceil,
    this.floor,
    this.ref,
    this.line_01,
    this.line_02,
    this.background_01,
    this.background_02,
    this.background_03,
    this.background_04,
    this.background_05,
    this.background_06,
    this.text_01,
    this.text_02,
    this.text_03,
    this.text_04,
    this.text_05,
    this.text_06,
    this.text_07,
    this.text_08,
    this.text_09,
    this.text_10,
  });

  factory CommonStyles.dark() {
    return const CommonStyles(
      primary_01: _DarkConfigColor._primary_01,
      primary_02: _DarkConfigColor._primary_02,
      primary_03: _DarkConfigColor._primary_03,
      primary_04: _DarkConfigColor._primary_04,
      primary_05: _DarkConfigColor._primary_05,
      secondary_01: _DarkConfigColor._secondary_01,
      secondary_02: _DarkConfigColor._secondary_02,
      secondary_03: _DarkConfigColor._secondary_03,
      secondary_04: _DarkConfigColor._secondary_04,
      up: _DarkConfigColor._up,
      down: _DarkConfigColor._down,
      ceil: _DarkConfigColor._ceil,
      floor: _DarkConfigColor._floor,
      ref: _DarkConfigColor._ref,
      line_01: _DarkConfigColor._line_01,
      line_02: _DarkConfigColor._line_02,
      background_01: _DarkConfigColor._background_01,
      background_02: _DarkConfigColor._background_02,
      background_03: _DarkConfigColor._background_03,
      background_04: _DarkConfigColor._background_04,
      background_05: _DarkConfigColor._background_05,
      background_06: _DarkConfigColor._background_06,
      text_01: _DarkConfigColor._text_01,
      text_02: _DarkConfigColor._text_02,
      text_03: _DarkConfigColor._text_03,
      text_04: _DarkConfigColor._text_04,
      text_05: _DarkConfigColor._text_05,
      text_06: _DarkConfigColor._text_06,
      text_07: _DarkConfigColor._text_07,
      text_08: _DarkConfigColor._text_08,
      text_09: _DarkConfigColor._text_09,
      text_10: _DarkConfigColor._text_10,
    );
  }

  factory CommonStyles.light() {
    return const CommonStyles(
      primary_01: _DarkConfigColor._primary_01,
      primary_02: _DarkConfigColor._primary_02,
      primary_03: _DarkConfigColor._primary_03,
      primary_04: _DarkConfigColor._primary_04,
      primary_05: _DarkConfigColor._primary_05,
      secondary_01: _DarkConfigColor._secondary_01,
      secondary_02: _DarkConfigColor._secondary_02,
      secondary_03: _DarkConfigColor._secondary_03,
      secondary_04: _DarkConfigColor._secondary_04,
      up: _DarkConfigColor._up,
      down: _DarkConfigColor._down,
      ceil: _DarkConfigColor._ceil,
      floor: _DarkConfigColor._floor,
      ref: _DarkConfigColor._ref,
      line_01: _DarkConfigColor._line_01,
      line_02: _DarkConfigColor._line_02,
      background_01: _DarkConfigColor._background_01,
      background_02: _DarkConfigColor._background_02,
      background_03: _DarkConfigColor._background_03,
      background_04: _DarkConfigColor._background_04,
      background_05: _DarkConfigColor._background_05,
      background_06: _DarkConfigColor._background_06,
      text_01: _DarkConfigColor._text_01,
      text_02: _DarkConfigColor._text_02,
      text_03: _DarkConfigColor._text_03,
      text_04: _DarkConfigColor._text_04,
      text_05: _DarkConfigColor._text_05,
      text_06: _DarkConfigColor._text_06,
      text_07: _DarkConfigColor._text_07,
      text_08: _DarkConfigColor._text_08,
      text_09: _DarkConfigColor._text_09,
      text_10: _DarkConfigColor._text_10,
    );
  }

  @override
  ThemeExtension<CommonStyles> copyWith({
    Color? primary_01,
    Color? primary_02,
    Color? primary_03,
    Color? primary_04,
    Color? primary_05,
    Color? secondary_01,
    Color? secondary_02,
    Color? secondary_03,
    Color? secondary_04,
    Color? up,
    Color? down,
    Color? ceil,
    Color? floor,
    Color? ref,
    Color? line_01,
    Color? line_02,
    Color? background_01,
    Color? background_02,
    Color? background_03,
    Color? background_04,
    Color? background_05,
    Color? background_06,
    Color? text_01,
    Color? text_02,
    Color? text_03,
    Color? text_04,
    Color? text_05,
    Color? text_06,
    Color? text_07,
    Color? text_08,
    Color? text_09,
    Color? text_10,
  }) =>
      CommonStyles(
        primary_01: primary_01 ?? this.primary_01,
        primary_02: primary_02 ?? this.primary_02,
        primary_03: primary_03 ?? this.primary_03,
        primary_04: primary_04 ?? this.primary_04,
        primary_05: primary_05 ?? this.primary_05,
        secondary_01: secondary_01 ?? this.secondary_01,
        secondary_02: secondary_02 ?? this.secondary_02,
        secondary_03: secondary_03 ?? this.secondary_03,
        secondary_04: secondary_04 ?? this.secondary_04,
        up: up ?? this.up,
        down: down ?? this.down,
        ceil: ceil ?? this.ceil,
        floor: floor ?? this.floor,
        ref: ref ?? this.ref,
        line_01: line_01 ?? this.line_01,
        line_02: line_02 ?? this.line_02,
        background_01: background_01 ?? this.background_01,
        background_02: background_02 ?? this.background_02,
        background_03: background_03 ?? this.background_03,
        background_04: background_04 ?? this.background_04,
        background_05: background_05 ?? this.background_05,
        background_06: background_06 ?? this.background_06,
        text_01: text_01 ?? this.text_01,
        text_02: text_02 ?? this.text_02,
        text_03: text_03 ?? this.text_03,
        text_04: text_04 ?? this.text_04,
        text_05: text_05 ?? this.text_05,
        text_06: text_06 ?? this.text_06,
        text_07: text_07 ?? this.text_07,
        text_08: text_08 ?? this.text_08,
        text_09: text_09 ?? this.text_09,
        text_10: text_10 ?? this.text_10,
      );

  @override
  ThemeExtension<CommonStyles> lerp(
      ThemeExtension<CommonStyles>? other, double t) {
    if (other is! CommonStyles) {
      return this;
    }

    return CommonStyles(
      primary_01: Color.lerp(primary_01, other.primary_01, t),
      primary_02: Color.lerp(primary_02, other.primary_02, t),
      primary_03: Color.lerp(primary_03, other.primary_03, t),
      primary_04: Color.lerp(primary_04, other.primary_04, t),
      primary_05: Color.lerp(primary_05, other.primary_05, t),
      secondary_01: Color.lerp(secondary_01, other.secondary_01, t),
      secondary_02: Color.lerp(secondary_02, other.secondary_02, t),
      secondary_03: Color.lerp(secondary_03, other.secondary_03, t),
      secondary_04: Color.lerp(secondary_04, other.secondary_04, t),
      up: Color.lerp(up, other.up, t),
      down: Color.lerp(down, other.down, t),
      ceil: Color.lerp(ceil, other.ceil, t),
      floor: Color.lerp(floor, other.floor, t),
      ref: Color.lerp(ref, other.ref, t),
      line_01: Color.lerp(line_01, other.line_01, t),
      line_02: Color.lerp(line_02, other.line_02, t),
      background_01: Color.lerp(background_01, other.background_01, t),
      background_02: Color.lerp(background_02, other.background_02, t),
      background_03: Color.lerp(background_03, other.background_03, t),
      background_04: Color.lerp(background_04, other.background_04, t),
      background_05: Color.lerp(background_05, other.background_05, t),
      background_06: Color.lerp(background_06, other.background_06, t),
      text_01: Color.lerp(text_01, other.text_01, t),
      text_02: Color.lerp(text_02, other.text_02, t),
      text_03: Color.lerp(text_03, other.text_03, t),
      text_04: Color.lerp(text_04, other.text_04, t),
      text_05: Color.lerp(text_05, other.text_05, t),
      text_06: Color.lerp(text_06, other.text_06, t),
      text_07: Color.lerp(text_07, other.text_07, t),
      text_08: Color.lerp(text_08, other.text_08, t),
      text_09: Color.lerp(text_09, other.text_09, t),
      text_10: Color.lerp(text_10, other.text_10, t),
    );
  }
}

final _darkColor = CommonStyles.dark();

ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: _darkColor.background_01,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: _darkColor.background_01,
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        color: _darkColor.text_05,
        fontSize: 18,
        height: 1.2,
        fontFamily: 'SFPro',
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      bodyText2:
      TextStyle(color: _darkColor.text_05, height: 1.2, fontSize: 14),
      subtitle1:
      TextStyle(color: _darkColor.text_05, height: 1.2, fontSize: 16),
    ).apply(fontFamily: 'SFPro'),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle:
      TextStyle(fontSize: 16, height: 1.2, color: _darkColor.text_05),
      labelStyle:
      TextStyle(fontSize: 16, height: 1.2, color: _darkColor.text_05),
      errorStyle: TextStyle(fontSize: 12, height: 0.7, color: _darkColor.down),
      helperStyle: const TextStyle(fontSize: 12, height: 0.7),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _darkColor.text_03!)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _darkColor.text_04!)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _darkColor.text_04!)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _darkColor.primary_04!)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _darkColor.down!)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _darkColor.text_08,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: _darkColor.text_08,
          height: 1.2,
        ),
        backgroundColor: _darkColor.primary_02,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18.5),
      ),
    ),
    bottomSheetTheme:
    BottomSheetThemeData(backgroundColor: _darkColor.background_02),
    extensions: [_darkColor]);
