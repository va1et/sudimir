import 'package:agro_hack23/presentation/pages/auth_page.dart';
import 'package:agro_hack23/presentation/pages/home_page.dart';
import 'package:agro_hack23/presentation/pages/profile/profile_page.dart';
import 'package:agro_hack23/presentation/pages/services/book_form.dart';
import 'package:agro_hack23/presentation/pages/services/book_page.dart';
import 'package:agro_hack23/presentation/pages/services/customers_page.dart';
import 'package:agro_hack23/presentation/pages/services/employee_form.dart';
import 'package:agro_hack23/presentation/pages/services/exibitions_page.dart';
import 'package:agro_hack23/presentation/pages/services/personal_page.dart';
import 'package:agro_hack23/presentation/pages/services/service_form.dart';
import 'package:agro_hack23/presentation/pages/services/services_page.dart';

import 'package:agro_hack23/presentation/widgets/scaf_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
GoRouter createRouter() => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: '/home',
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) => const AuthUserScreen(),
          ),
          StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return ScaffoldWithNavBar(navigationShell: navigationShell);
              },
              branches: [
                StatefulShellBranch(routes: [
                  GoRoute(
                      path: '/services',
                      builder: (context, state) => const ServicesScreen(),
                      routes: [
                        GoRoute(
                            path: 'books',
                            builder: (context, state) => const BookingsScreen(),
                            routes: [
                              GoRoute(
                                path: 'booking',
                                builder: (context, state) =>
                                    const BookingScreen(),
                              ),
                            ]),
                        GoRoute(
                            path: 'ecursions',
                            builder: (context, state) =>
                                const ExcursionsScreen(),
                            routes: [
                              GoRoute(
                                path: 'send',
                                builder: (context, state) =>
                                    const ServiceSendScreen(),
                              ),
                            ]),
                        GoRoute(
                            path: 'personals',
                            builder: (context, state) =>
                                const PersonalsScreen(),
                            routes: [
                              GoRoute(
                                path: 'send',
                                builder: (context, state) =>
                                    const EmployeeAddScreen(),
                              ),
                            ]),
                        GoRoute(
                          path: 'users',
                          builder: (context, state) => const CustomersScreen(),
                        ),
                      ])
                ]),
                StatefulShellBranch(routes: [
                  GoRoute(
                    path: '/profile',
                    builder: (context, state) => const ProfileScreen(),
                  )
                ])
              ]),
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
        ]);
