// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/init_view.dart';
import '../ui/views/task_detail_view.dart';

class Routes {
  static const String initScreen = '/';
  static const String secondTestScreen = '/second-test-screen';
  static const all = <String>{
    initScreen,
    secondTestScreen,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.initScreen, page: InitScreen),
    RouteDef(Routes.secondTestScreen, page: TaskDetailScreen),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    InitScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const InitScreen(),
        settings: data,
      );
    },
    TaskDetailScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const TaskDetailScreen(),
        settings: data,
      );
    },
  };
}
