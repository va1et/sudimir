import 'package:agro_hack23/presentation/bloc/employees/employees_bloc.dart';
import 'package:agro_hack23/presentation/colors.dart';
import 'package:agro_hack23/presentation/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:shimmer/shimmer.dart';

class PersonalsScreen extends StatelessWidget {
  const PersonalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Theme.of(context).scaffoldBackgroundColor),
          middle: Text(
            "Персонал",
            style: DarkTextTheme.headline1NS.copyWith(
              color: Theme.of(context).focusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: IconButton(
            splashColor: Colors.transparent,
            hoverColor: LightThemeColors.primary
                .withRed((LightThemeColors.primary.red * 0.85).round())
                .withGreen((LightThemeColors.primary.green * 0.85).round())
                .withBlue((LightThemeColors.primary.blue * 0.85).round()),
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              context.push('/services/personals/send');
            },
            color: LightThemeColors.primary,
            icon: const Icon(
              CupertinoIcons.add,
              size: 24,
            ),
          ),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              context.pop();
            },
            color: const Color(0xFF808B9F),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<EmployeesBloc, EmployeesState>(
            builder: (context, state) {
          print(state);
          if (state is EmployeesStateLoaded) {
            return RefreshIndicator(
                onRefresh: () async {
                  context.read<EmployeesBloc>().add(const EmployeesGet());
                },
                child: SafeArea(
                  bottom: false,
                  child: state.employees.isNotEmpty
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.015,
                          ),
                          itemCount: state.employees.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                                direction: DismissDirection.endToStart,
                                key: Key(state.employees[index].toString()),
                                background: Container(
                                  color: Colors.red,
                                  child: const Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Icon(
                                            CupertinoIcons.trash,
                                            color: Colors.white,
                                          ))),
                                ),
                                onDismissed: (direction) {
                                  context.read<EmployeesBloc>().add(
                                      EmployeeRemove(
                                          id: state.employees[index].id!));
                                },
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  child: Card(
                                      elevation: 4,
                                      shadowColor: const Color(0xFF0C2975)
                                          .withOpacity(0.12),
                                      color: Theme.of(context).cardColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12.0), //<-- SEE HERE
                                      ),
                                      child: InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {},
                                          child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding: EdgeInsets.only(
                                                                left: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.05),
                                                            child: SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Wrap(
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      state
                                                                          .employees[
                                                                              index]
                                                                          .role!,
                                                                      style: DarkTextTheme
                                                                          .calloutNS
                                                                          .copyWith(
                                                                              color: Theme.of(context).focusColor),
                                                                    )
                                                                  ],
                                                                ))),
                                                      ],
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: Text(
                                                          state.employees[index]
                                                              .phone!,
                                                          style: DarkTextTheme
                                                              .subheadlineNS
                                                              .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .focusColor),
                                                        )),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: Text(
                                                          state.employees[index]
                                                                  .name! +
                                                              " " +
                                                              state
                                                                  .employees[
                                                                      index]
                                                                  .secondName! +
                                                              " " +
                                                              state
                                                                  .employees[
                                                                      index]
                                                                  .lastName!,
                                                          style: DarkTextTheme
                                                              .headline1NS
                                                              .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .focusColor),
                                                        )),
                                                  ])))),
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(
                            thickness: 0,
                            color: Theme.of(context).focusColor.withOpacity(0),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Column(
                            children: [
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 16.0)),
                              Text(
                                style: DarkTextTheme.calloutNS.copyWith(
                                    color: Theme.of(context).focusColor),
                                "Работников нет",
                              ),
                              SvgPicture.asset(
                                'assets/images/nodata.svg',
                                height: 450,
                              )
                            ],
                          )),
                        ),
                ));
          } else if (state is EmployeesStateLoading) {
            return SafeArea(
                bottom: false,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.015,
                      vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (_, __) => ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 88,
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.95,
                              ),
                              child: Card(
                                  elevation: 4,
                                  shadowColor:
                                      const Color(0xFF0C2975).withOpacity(0.12),
                                  color: Theme.of(context).cardColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12.0), //<-- SEE HERE
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Shimmer.fromColors(
                                        baseColor:
                                            Theme.of(context).indicatorColor,
                                        highlightColor:
                                            Theme.of(context).cardColor,
                                        direction: ShimmerDirection.ltr,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 60,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: Theme.of(context)
                                                          .cardColor,
                                                    ),
                                                    width: double.infinity,
                                                    height: 20.0,
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.0),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: Theme.of(context)
                                                          .cardColor,
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.0),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )))),
                          itemCount: 7,
                        ),
                      ),
                    ],
                  ),
                ));
          } else {
            return Container();
          }
        }));
  }
}
