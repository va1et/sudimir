import 'package:agro_hack23/presentation/bloc/book/book_bloc.dart';
import 'package:agro_hack23/presentation/bloc/customers/customers_bloc.dart';
import 'package:agro_hack23/presentation/bloc/employees/employees_bloc.dart';
import 'package:agro_hack23/presentation/bloc/excursion/excursion_bloc.dart';
import 'package:agro_hack23/presentation/bloc/user/user_bloc.dart';
import 'package:agro_hack23/presentation/provider/book_provider.dart';
import 'package:agro_hack23/presentation/provider/employee_add_provider.dart';
import 'package:agro_hack23/presentation/provider/service_provider.dart';
import 'package:agro_hack23/presentation/routes/app_routes.dart';
import 'package:agro_hack23/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/bloc/user/user_bloc.dart';

import 'package:agro_hack23/service_locator.dart' as dependency_injection;
import 'package:agro_hack23/service_locator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl_standalone.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependency_injection.setup();

  setPathUrlStrategy();

  findSystemLocale().then((_) => runApp(App()));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    final router = getIt<GoRouter>();
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
              create: (context) =>
                  getIt<UserBloc>()..add(const UserEvent.getAuthToken())),
          BlocProvider<BookBloc>(create: (context) => getIt<BookBloc>()),
          BlocProvider<ExcursionBloc>(
              create: (context) => getIt<ExcursionBloc>()),
          BlocProvider<EmployeesBloc>(
              create: (context) => getIt<EmployeesBloc>()),
          BlocProvider<CustomersBloc>(
              create: (context) => getIt<CustomersBloc>()),
        ],
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider<BookProvider>(
                  create: (_) => BookProvider()),
              ChangeNotifierProvider<ServiceProvider>(
                  create: (_) => ServiceProvider()),
              ChangeNotifierProvider<EmployeeProvider>(
                  create: (_) => EmployeeProvider()),
            ],
            child: MaterialApp.router(
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ru'),
                ],
                theme: lightTheme,
                locale: const Locale('ru'),
                debugShowCheckedModeBanner: false,
                routerConfig: router)));
  }
}
