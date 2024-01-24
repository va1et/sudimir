import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/bloc/user/user_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      builder: (context, state) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFFFFFFFF),
            child: Center(child: Image.asset('assets/images/logo.png')));
      },
      listener: (BuildContext context, UserState state) {
        state.whenOrNull(
          logInSuccess: (user) => context.go('/profile'),
          unauthorized: () => context.go('/login'),
          logInError: (cause) => context.go('/login'),
        );
      },
    );
  }
}
